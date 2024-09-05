using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.Interfaces;
using MySocailApp.Domain.SolutionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.SolutionMarkedAsIncorrectDomainEventConsumers
{
    public class CreateNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IQuestionReadRepository questionReadRepository, IHubContext<NotificationHub> notificationHub, IMapper mapper, INotificationConnectionReadRepository notificationConnectionRepository) : IDomainEventConsumer<SolutionMarkedAsIncorrectDomainEvent>
    {
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationConnectionReadRepository _notificationConnectionRepository = notificationConnectionRepository;
        private readonly IMapper _mapper = mapper;

        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(SolutionMarkedAsIncorrectDomainEvent notification, CancellationToken cancellationToken)
        {
            var solution = notification.Solution;
            var question = await _questionReadRepository.GetAsync(solution.QuestionId, cancellationToken);
            if (question == null) return;

            var n = Notification.SolutionMarkedAsIncorrectNotification(solution.AppUserId, question.AppUserId, solution.QuestionId, solution.Id);
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            var connection = await _notificationConnectionRepository.GetByIdAsync(solution.AppUserId,cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var mn = _mapper.Map<NotificationResponseDto>(n);
            await _notificationHub.Clients.Client(connection.ConnectionId!).SendAsync("getSolutionMarkAsIncorrectNotification", mn, cancellationToken);
        }
    }
}

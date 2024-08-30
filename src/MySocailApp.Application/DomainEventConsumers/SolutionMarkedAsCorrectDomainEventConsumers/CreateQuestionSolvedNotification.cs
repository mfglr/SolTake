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

namespace MySocailApp.Application.DomainEventConsumers.SolutionMarkedAsCorrectDomainEventConsumers
{
    public class CreateQuestionSolvedNotification(IQuestionReadRepository questionReadRepository, INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IHubContext<NotificationHub> notificationHub, INotificationConnectionReadRepository notificationConnectionRepository, IMapper mapper) : IDomainEventConsumer<SolutionMarkedAsCorrectDomainEvent>
    {
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationConnectionReadRepository _notificationConnectionRepository = notificationConnectionRepository;
        private readonly IMapper _mapper = mapper;

        public async Task Handle(SolutionMarkedAsCorrectDomainEvent notification, CancellationToken cancellationToken)
        {
            var solution = notification.Solution;
            var question = await _questionReadRepository.GetAsync(solution.QuestionId, cancellationToken);
            if (question == null) return;

            var n = Notification.QuestionSolvedNotification(question.AppUserId, solution.AppUserId, solution.Id);
            await _notificationWriteRepository.CreateAsync(n,cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            var connection = await _notificationConnectionRepository.GetByIdAsync(question.AppUserId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var mn = _mapper.Map<NotificationResponseDto>(n);
            await _notificationHub.Clients.Client(connection.ConnectionId!).SendAsync("getNotification", mn,cancellationToken);
        }
    }
}

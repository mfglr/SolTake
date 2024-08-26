using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.QuestionLikedDomainEventConumers
{
    public class CreateNotification(INotificationWriteRepository notificationRepository, IUnitOfWork unitOfWork, IHubContext<NotificationHub> notificationHub, IMapper mapper, INotificationConnectionReadRepository notificationConnectionReadRepository) : IDomainEventConsumer<QuestionLikedDomainEvent>
    {
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;

        private readonly IMapper _mapper = mapper;

        private readonly INotificationWriteRepository _notificationRepository = notificationRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(QuestionLikedDomainEvent notification, CancellationToken cancellationToken)
        {
            var question = notification.Question;
            var n = Notification.QuestionLikedNotification(question.AppUserId, question.Id, notification.LikerId);
            await _notificationRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            
            var connection = await _notificationConnectionReadRepository.GetByIdAsync(question.AppUserId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;
            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync("getNotification", _mapper.Map<NotificationResponseDto>(n), cancellationToken);
        }
    }
}

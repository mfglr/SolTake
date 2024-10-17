using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Core;
using MySocailApp.Domain.NotificationAggregate.DomainEvents;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.NotificationAggregate.QuestionLikedNotificationCreatedDomainEventConsumers
{
    public class SendNotification(IHubContext<NotificationHub> notificationHub, INotificationConnectionReadRepository notificationConnectionReadRepository, IQuestionUserLikeQueryRepository questionUserLikeQueryRepository, IMapper mapper) : IDomainEventConsumer<QuestionLikedNotificationCreatedDomainEvent>
    {
        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly IQuestionUserLikeQueryRepository _questionUserLikeQueryRepository = questionUserLikeQueryRepository;
        private readonly IMapper _mapper = mapper;

        public async Task Handle(QuestionLikedNotificationCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var ownerId = notification.Notification.OwnerId;

            var connection = await _notificationConnectionReadRepository.GetByIdAsync(ownerId, cancellationToken);
            if (connection == null || !connection.IsConnected) return;

            var question = await _questionUserLikeQueryRepository.GetQuestionLikeAsync(ownerId, notification.LikeId, cancellationToken);
            if(question == null) return;

            await _notificationHub.Clients
                .Client(connection.ConnectionId!)
                .SendAsync(
                    "getQuestionLikedNotification",
                    _mapper.Map<NotificationResponseDto>(notification.Notification),
                    question,
                    cancellationToken
                );
        }
    }
}

using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Hubs;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Application.Queries.NotificationAggregate;
using MySocailApp.Core;
using MySocailApp.Domain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;
using MySocailApp.Domain.NotificationConnectionAggregate.Interfaces;
using MySocailApp.Domain.QuestionAggregate.Interfaces;

namespace MySocailApp.Application.DomainEventConsumers.QuestionCommentCreatedDomainEventConsumers
{
    public class CreateNotification(INotificationWriteRepository notificationWriteRepository, IUnitOfWork unitOfWork, IQuestionReadRepository questionReadRepository, INotificationConnectionReadRepository notificationConnectionReadRepository, IHubContext<NotificationHub> notificationHub, IMapper mapper, ICommentReadRepository commentReadRepository) : IDomainEventConsumer<QuestionCommentCreatedDomainEvent>
    {
        private readonly INotificationWriteRepository _notificationWriteRepository = notificationWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;

        private readonly IHubContext<NotificationHub> _notificationHub = notificationHub;
        private readonly INotificationConnectionReadRepository _notificationConnectionReadRepository = notificationConnectionReadRepository;
        private readonly ICommentReadRepository _commentReadRepository = commentReadRepository;
        private readonly IMapper _mapper = mapper;

        public async Task Handle(QuestionCommentCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var comment = notification.Comment;
            var question = await _questionReadRepository.GetAsync((int)comment.QuestionId!, cancellationToken);
            if (question == null) return;

            var n = Notification.QuestionCommentCreatedNotification(question.AppUserId, comment.AppUserId, comment.Id, (int)comment.QuestionId!);
            await _notificationWriteRepository.CreateAsync(n, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            var connection = await _notificationConnectionReadRepository.GetByIdAsync(question.AppUserId, cancellationToken);
            if (connection == null || !connection.IsConnected || connection.ConnectionId == null) return;

            var c = await _commentReadRepository.GetByIdAsync(comment.Id, cancellationToken);
            if (c == null) return;

            var mc = _mapper.Map<CommentResponseDto>(c);
            var mn = _mapper.Map<NotificationResponseDto>(n);
            await _notificationHub.Clients.Client(connection.ConnectionId).SendAsync("getNotification", mn, mc, cancellationToken);
        }
    }
}

using MySocailApp.Domain.ConversationAggregate.Exceptions;
using MySocailApp.Domain.ConversationAggregate.Interfaces;
using MySocailApp.Domain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Exceptions;

namespace MySocailApp.Domain.MessageAggregate.DomainServices
{
    public class MessageStateUpdaterDomainService(IConversationReadRepository conversationRepository)
    {
        private readonly IConversationReadRepository _conversationRepository = conversationRepository;

        public async Task AddReceiverAsync(Message message, int receiverId, CancellationToken cancellationToken)
        {
            var conversation =
                await _conversationRepository.GetByIdAsync(message.ConversationId, cancellationToken) ??
                throw new ConversationNotFoundException();

            if (!conversation.Users.Any(x => x.AppUserId == receiverId))
                throw new PermissionDeniedToChangeStateOfMessageException();

            message.AddReceiver(receiverId);
            message.AddDomainEvent(new AddedReceiverToMessagesDomainEvent(message.OwnerId, receiverId, [message]));
        }
        public async Task AddReceiverAsync(IEnumerable<Message> messages, int receiverId, CancellationToken cancellationToken)
        {
            var groupsByConversationId = messages.GroupBy(x => x.ConversationId);
            foreach (var group in groupsByConversationId)
            {
                var conversation =
                    await _conversationRepository.GetByIdAsync(group.Key, cancellationToken) ??
                    throw new ConversationNotFoundException();

                if (!conversation.Users.Any(x => x.AppUserId == receiverId))
                    throw new PermissionDeniedToChangeStateOfMessageException();

                foreach (Message message in group)
                    message.AddReceiver(receiverId);
            }
            var groupsByOwnerId = messages.GroupBy(x => x.OwnerId);
            foreach (var group in groupsByOwnerId)
                group.First().AddDomainEvent(new AddedReceiverToMessagesDomainEvent(group.Key, receiverId, group));
        }

        public async Task AddViewerAsync(Message message, int viewerId, CancellationToken cancellationToken)
        {
            var conversation =
                await _conversationRepository.GetByIdAsync(message.ConversationId, cancellationToken) ??
                throw new ConversationNotFoundException();

            if (!conversation.Users.Any(x => x.AppUserId == viewerId))
                throw new PermissionDeniedToChangeStateOfMessageException();

            message.AddViewer(viewerId);
            message.AddDomainEvent(new AddViewerToMessagesDomainEvent(message.OwnerId, viewerId, [message]));
        }
        public async Task AddViewerAsync(IEnumerable<Message> messages, int viewerId, CancellationToken cancellationToken)
        {
            var groupByConversationId = messages.GroupBy(x => x.ConversationId);
            foreach (var group in groupByConversationId)
            {
                var conversation =
                    await _conversationRepository.GetByIdAsync(group.Key, cancellationToken) ??
                    throw new ConversationNotFoundException();

                if (!conversation.Users.Any(x => x.AppUserId == viewerId))
                    throw new PermissionDeniedToChangeStateOfMessageException();

                foreach (Message message in group)
                    message.AddViewer(viewerId);
            }

            var groupsByOwnerId = messages.GroupBy(x => x.OwnerId);
            foreach (var group in groupsByOwnerId)
                group.First().AddDomainEvent(new AddViewerToMessagesDomainEvent(group.Key, viewerId, group));
        }
    }
}

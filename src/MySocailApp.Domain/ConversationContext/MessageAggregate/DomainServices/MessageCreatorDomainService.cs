using MySocailApp.Domain.ConversationContext.ConversationAggregate.Entities;
using MySocailApp.Domain.ConversationContext.ConversationAggregate.Interfaces;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Entities;
using MySocailApp.Domain.ConversationContext.MessageAggregate.Interfaces;

namespace MySocailApp.Domain.ConversationContext.MessageAggregate.DomainServices
{
    public class MessageCreatorDomainService(IConversationWriteRepository conversationRepository, IMessageWriteRepository messageRepository)
    {
        private readonly IConversationWriteRepository _conversationRepository = conversationRepository;
        private readonly IMessageWriteRepository _messageRepository = messageRepository;

        public async Task CreateAsync(Message message,CancellationToken cancellationToken)
        {
            var conversation = await _conversationRepository.GetByIdAsync(message.SenderId, message.ReceiverId, cancellationToken);
            if(conversation == null)
            {
                conversation = new Conversation();
                conversation.Create(message.SenderId, message.ReceiverId);
                await _conversationRepository.CreateAsync(conversation, cancellationToken);
            }
            conversation.UpdateLastMessageDate();
            message.Create();
            await _messageRepository.CreateAsync(message, cancellationToken);
        }

    }
}

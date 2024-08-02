using MySocailApp.Domain.ConversationAggregate.Entities;
using MySocailApp.Domain.ConversationAggregate.Interfaces;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Interfaces;
using MySocailApp.Domain.Shared;

namespace MySocailApp.Domain.MessageAggregate.DomainServices
{
    public class MessageCreatorDomainService(IConversationWriteRepository conversationRepository, IMessageWriteRepository messageRepository, IUnitOfWork unitOfWork, ITransactionCreator transactionCreator)
    {
        private readonly IConversationWriteRepository _conversationRepository = conversationRepository;
        private readonly IMessageWriteRepository _messageRepository = messageRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ITransactionCreator _transactionCreator = transactionCreator;

        public async Task CreateAsync(Message message, int receiverId, CancellationToken cancellationToken)
        {
            var trasaction = await _transactionCreator.CreateTransactionAsync(cancellationToken);

            //Create a conversation if it does not exist and update its property lastMessageCreatedAt;
            var conversation = await _conversationRepository.GetByUserIdsAsync([message.OwnerId, receiverId], cancellationToken);
            if (conversation == null)
            {
                conversation = new Conversation();
                conversation.Create(message.OwnerId, receiverId);
                await _conversationRepository.CreateAsync(conversation, cancellationToken);
                await _unitOfWork.CommitAsync(cancellationToken);
            }
            
            //Create the message;
            message.Create(conversation.Id, receiverId);
            await _messageRepository.CreateAsync(message, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await trasaction.CommitAsync(cancellationToken);
        }

    }
}

using MySocailApp.Application.InfrastructureServices;
using SolTake.Domain.UserUserConversationAggregate.Abstracts;
using SolTake.Domain.UserUserConversationAggregate.DomainServices;
using SolTake.Domain.UserUserConversationAggregate.Entities;
using SolTake.Core;
using SolTake.Domain.MessageAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.MessageCreatedDomainEventConsumers.UserUserConversationAggregate
{
    public class CreateUserUserConversation(IUserUserConversationWriteRepository userUserConversationWriteRepository, UserUserConversationCreatorDomainService userUserConversationCreatorDomainService, IUnitOfWork unitOfWork) : IDomainEventConsumer<MessageCreatedDomainEvent>
    {
        private readonly IUserUserConversationWriteRepository _userUserConversationWriteRepository = userUserConversationWriteRepository;
        private readonly UserUserConversationCreatorDomainService _userUserConversationCreatorDomainService = userUserConversationCreatorDomainService;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task Handle(MessageCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var userUserConversation = new UserUserConversation(notification.Message.SenderId, notification.Message.ReceiverId);
            await _userUserConversationCreatorDomainService.CreateAsync(userUserConversation, cancellationToken);
            await _userUserConversationWriteRepository.CreateAsync(userUserConversation, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}

using Microsoft.AspNetCore.Identity;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.DomainEvents;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Interfaces;

namespace MySocailApp.Domain.MessageAggregate.DomainServices
{
    public class MessageRemoverDomainService(IMessageWriteRepository messageWriteRepository, UserManager<Account> userManager)
    {
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;
        private readonly UserManager<Account> _userManager = userManager;
        public async Task RemoveAsync(Message message, int removerId)
        {
            if (message.Removers.Count == 1 && message.Removers[0].AppUserId != removerId)
            {
                _messageWriteRepository.Delete(message);
                var account = (await _userManager.FindByIdAsync(message.SenderId.ToString()))!;
                account.AddDomainEvent(new MessageDeletedDomainEvent(message));
            }
            else
                message.Remove(removerId);
        }
    }
}

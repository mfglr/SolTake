using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Entities;
using MySocailApp.Domain.MessageAggregate.Exceptions;
using MySocailApp.Domain.MessageAggregate.Interfaces;

namespace MySocailApp.Domain.MessageAggregate.DomainServices
{
    public class MessageCreaterDomainService(UserManager<Account> userManager, IMessageWriteRepository messageWriteRepository)
    {
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IMessageWriteRepository _messageWriteRepository = messageWriteRepository;

        public async Task CreateAsync(Message message, int receiverId, CancellationToken cancellationToken)
        {
            if (!await _userManager.Users.AnyAsync(x => x.Id == receiverId))
                throw new ReceiverNotFoundException();
            message.Create(receiverId);
            await _messageWriteRepository.CreateAsync(message, cancellationToken);
        }
    }
}

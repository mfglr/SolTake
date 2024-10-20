using MediatR;
using Microsoft.AspNetCore.Identity;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.AccountAggregate.DomainEvents;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Application.Commands.AccountAggregate.DeleteAccount
{
    public class DeleteAccountHandler(UserManager<Account> userManager, IAccessTokenReader tokenReader, IPublisher publisher) : IRequestHandler<DeleteAccountDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly UserManager<Account> _userManager = userManager;
        private readonly IPublisher _publisher = publisher;

        public async Task Handle(DeleteAccountDto request, CancellationToken cancellationToken)
        {
            var accountId = _tokenReader.GetRequiredAccountId();
            var account =
                await _userManager.FindByIdAsync(accountId.ToString()) ??
                throw new AccountNotFoundException();

            await _userManager.DeleteAsync(account);

            await _publisher.Publish(new AccountDeletedDomainEvent(account));
        }
    }
}

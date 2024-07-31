using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.AccountCreatedDomainEventConsumers
{
    public class SendEmailConfirmationMail(IEmailService emailService) : IDomainEventConsumer<AccountCreatedDominEvent>
    {
        private readonly IEmailService _emailService = emailService;

        public async Task Handle(AccountCreatedDominEvent notification, CancellationToken cancellationToken)
        {
            var account = notification.Account;
            await _emailService.SendEmailConfirmationByTokenMail(
                account.EmailConfirmationToken, notification.Account.UserName!,notification.Account.Email!,cancellationToken
            );
        }
    }
}

using AccountDomain.AccountAggregate.DomainEvents;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;

namespace MySocailApp.Application.DomainEventConsumers.AccountCreatedDomainEventConsumers.AccountAggregate
{
    public class SendEmailConfirmationMail(IEmailService emailService) : IDomainEventConsumer<AccountCreatedDominEvent>
    {
        private readonly IEmailService _emailService = emailService;

        public async Task Handle(AccountCreatedDominEvent notification, CancellationToken cancellationToken)
        {
            if (notification.Account.GoogleAccount != null) return;

            var verificationToken = notification.Account.VerificationTokens.OrderByDescending(x => x.Id).First();
            await _emailService
                .SendEmailVerificationMail(
                    notification.Account.Language.Value,
                    verificationToken.Value,
                    notification.Account.UserName.Value,
                    notification.Account.Email.Value,
                    cancellationToken
                );
        }
    }
}

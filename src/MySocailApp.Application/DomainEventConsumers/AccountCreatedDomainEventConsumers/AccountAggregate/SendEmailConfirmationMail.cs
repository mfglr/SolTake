using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.AccountDomain.AccountAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.AccountCreatedDomainEventConsumers.AccountAggregate
{
    public class SendEmailConfirmationMail(IEmailService emailService) : IDomainEventConsumer<AccountCreatedDominEvent>
    {
        private readonly IEmailService _emailService = emailService;

        public async Task Handle(AccountCreatedDominEvent notification, CancellationToken cancellationToken)
        {
            if (notification.Account.Email == null) return;

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

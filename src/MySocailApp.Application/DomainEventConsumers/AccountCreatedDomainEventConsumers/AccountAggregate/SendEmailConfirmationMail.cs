using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.AccountCreatedDomainEventConsumers.AccountAggregate
{
    public class SendEmailConfirmationMail(IEmailService emailService) : IDomainEventConsumer<AccountCreatedDominEvent>
    {
        private readonly IEmailService _emailService = emailService;

        public async Task Handle(AccountCreatedDominEvent notification, CancellationToken cancellationToken)
        {
            if (notification.Account.IsThirdPartyAuthenticated) return;
            var verificationToken = notification.Account.VerificationTokens.OrderByDescending(x => x.Id).First();
            await _emailService
                .SendEmailConfirmationByTokenMail(
                    notification.Account.Language,
                    verificationToken.Token,
                    notification.Account.UserName!,
                    notification.Account.Email!,
                    cancellationToken
                );
        }
    }
}

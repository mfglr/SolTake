using AccountDomain.AccountAggregate.DomainEvents;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;

namespace MySocailApp.Application.DomainEventConsumers.EmailVerificationTokenUpdatedDomainEventConsumers.AccountAggregate
{
    public class SendEmailConfirmationMail(IEmailService emailService) : IDomainEventConsumer<EmailVerificationTokenUpdatedDomainEvent>
    {
        private readonly IEmailService _emailService = emailService;

        public async Task Handle(EmailVerificationTokenUpdatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var a = notification.Account;

            if(a.Email != null)
                await _emailService.SendEmailVerificationMail(
                    a.Language.Value,
                    a.VerificationToken.Value,
                    a.UserName.Value,
                    a.Email.Value,
                    cancellationToken
                );
        }
    }
}

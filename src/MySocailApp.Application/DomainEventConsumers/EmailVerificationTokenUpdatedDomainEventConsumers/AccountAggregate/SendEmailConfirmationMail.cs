using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.AccountDomain.AccountAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.EmailVerificationTokenUpdatedDomainEventConsumers.AccountAggregate
{
    public class SendEmailConfirmationMail(IEmailService emailService) : IDomainEventConsumer<EmailVerificationTokenUpdatedDomainEvent>
    {
        private readonly IEmailService _emailService = emailService;

        public async Task Handle(EmailVerificationTokenUpdatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var a = notification.Account;
            await _emailService.SendEmailVerificationMail(a.Language.Value, a.VerificationToken.Value,a.UserName.Value,a.Email.Value,cancellationToken);
        }
    }
}

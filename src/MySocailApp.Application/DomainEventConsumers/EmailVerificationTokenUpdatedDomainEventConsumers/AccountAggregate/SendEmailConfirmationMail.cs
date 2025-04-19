using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.UserAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.EmailVerificationTokenUpdatedDomainEventConsumers.AccountAggregate
{
    public class SendEmailConfirmationMail(IEmailService emailService) : IDomainEventConsumer<EmailVerificationTokenUpdatedDomainEvent>
    {
        private readonly IEmailService _emailService = emailService;

        public Task Handle(EmailVerificationTokenUpdatedDomainEvent notification, CancellationToken cancellationToken)
            => _emailService.SendEmailVerificationMail(
                    notification.User.Language.Value,
                    notification.User.VerificationToken.Value,
                    notification.User.UserName.Value,
                    notification.User.Email.Value,
                    cancellationToken
                );

    }
}

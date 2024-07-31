using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.EmailConfirmationTokenUpdatedDomainEventConsumers
{
    public class SendEmailConfirmationMail(IEmailService emailService) : IDomainEventConsumer<EmailConfirmationtokenUpdatedDomainEvent>
    {
        private readonly IEmailService _emailService = emailService;

        public async Task Handle(EmailConfirmationtokenUpdatedDomainEvent notification, CancellationToken cancellationToken)
        {
            await _emailService.SendEmailConfirmationByTokenMail(
                notification.Account.EmailConfirmationToken, 
                notification.Account.UserName!, 
                notification.Account.Email!, 
                cancellationToken
            );
        }
    }
}

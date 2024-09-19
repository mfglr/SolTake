using Microsoft.AspNetCore.Http;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Extentions;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.EmailConfirmationTokenUpdatedDomainEventConsumers
{
    public class SendEmailConfirmationMail(IEmailService emailService, IHttpContextAccessor contextAccessor) : IDomainEventConsumer<EmailConfirmationtokenUpdatedDomainEvent>
    {
        private readonly IEmailService _emailService = emailService;
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;

        public async Task Handle(EmailConfirmationtokenUpdatedDomainEvent notification, CancellationToken cancellationToken)
        {
            if (notification.Account.EmailConfirmationToken == null) return;
            
            await _emailService
                .SendEmailConfirmationByTokenMail(
                    _contextAccessor.HttpContext.GetLanguage(),
                    notification.Account.EmailConfirmationToken,
                    notification.Account.UserName!,
                    notification.Account.Email!,
                    cancellationToken
                );
        }
    }
}

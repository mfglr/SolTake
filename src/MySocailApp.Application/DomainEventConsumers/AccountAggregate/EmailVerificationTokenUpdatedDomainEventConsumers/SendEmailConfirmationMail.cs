using Microsoft.AspNetCore.Http;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Extentions;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.AccountAggregate.EmailVerificationTokenUpdatedDomainEventConsumers
{
    public class SendEmailConfirmationMail(IEmailService emailService, IHttpContextAccessor contextAccessor) : IDomainEventConsumer<EmailVerificationTokenUpdatedDomainEvent>
    {
        private readonly IEmailService _emailService = emailService;
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;

        public async Task Handle(EmailVerificationTokenUpdatedDomainEvent notification, CancellationToken cancellationToken)
        {
            var verificationToken = notification.Account.VerificationTokens.OrderByDescending(x => x.Id).First();
            await _emailService
                .SendEmailConfirmationByTokenMail(
                    _contextAccessor.HttpContext.GetLanguage(),
                    verificationToken.Token,
                    notification.Account.UserName!,
                    notification.Account.Email!,
                    cancellationToken
                );
        }
    }
}

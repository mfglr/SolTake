using Microsoft.AspNetCore.Http;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Extentions;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.AccountCreatedDomainEventConsumers
{
    public class SendEmailConfirmationMail(IEmailService emailService, IHttpContextAccessor contextAccessor) : IDomainEventConsumer<AccountCreatedDominEvent>
    {
        private readonly IEmailService _emailService = emailService;
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;

        public async Task Handle(AccountCreatedDominEvent notification, CancellationToken cancellationToken)
        {
            var account = notification.Account;
            
            if (account.EmailConfirmationToken == null || notification.Account.Email == null) return;

            if (!account.IsThirdPartyAuthenticated)
                await _emailService
                    .SendEmailConfirmationByTokenMail(
                        _contextAccessor.HttpContext.GetLanguage(),
                        account.EmailConfirmationToken.Token,
                        notification.Account.UserName!,
                        notification.Account.Email,
                        cancellationToken
                    );
        }
    }
}

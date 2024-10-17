using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.DomainEvents;

namespace MySocailApp.Application.DomainEventConsumers.AccountAggregate.AccountCreatedDomainEventConsumers
{
    public class SendEmailConfirmationMail(IServiceProvider serviceProvider) : IDomainEventConsumer<AccountCreatedDominEvent>
    {
        private readonly IServiceProvider _serviceProvider = serviceProvider;

        public async Task Handle(AccountCreatedDominEvent notification, CancellationToken cancellationToken)
        {
            using var scope = _serviceProvider.CreateScope();
            var emailService = scope.ServiceProvider.GetRequiredService<IEmailService>();

            if (notification.Account.IsThirdPartyAuthenticated) return;
            var verificationToken = notification.Account.VerificationTokens.OrderByDescending(x => x.Id).First();
            await emailService
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

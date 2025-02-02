using AccountDomain.AccountAggregate.DomainEvents;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;

namespace MySocailApp.Application.DomainEventConsumers.PassworResetTokenGeneratedDomainEventConsumers.AccountAggregate
{
    public class SendEmail(IEmailService emailService) : IDomainEventConsumer<PasswordResetTokenGeneratedDomainEvent>
    {
        private readonly IEmailService _emailService = emailService;

        public async Task Handle(PasswordResetTokenGeneratedDomainEvent notification, CancellationToken cancellationToken)
        {
            var a = notification.Account;
            var passwordResetToken = a.PasswordResetToken;
            if (passwordResetToken == null) return;
            await _emailService
                .SendResetPasswordMailMessage(
                    a.Language.Value,
                    passwordResetToken.Value,
                    a.UserName.Value,
                    a.Email!.Value,
                    cancellationToken
                );
        }
    }
}

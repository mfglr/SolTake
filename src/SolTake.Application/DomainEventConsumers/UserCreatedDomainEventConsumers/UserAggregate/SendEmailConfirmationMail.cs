using SolTake.Application.InfrastructureServices;
using SolTake.Domain.UserAggregate.DomainEvents;
using SolTake.Core;

namespace SolTake.Application.DomainEventConsumers.AccountCreatedDomainEventConsumers.AccountAggregate
{
    public class SendEmailConfirmationMail(IEmailService emailService) : IDomainEventConsumer<UserCreatedDomainEvent>
    {
        private readonly IEmailService _emailService = emailService;

        public async Task Handle(UserCreatedDomainEvent notification, CancellationToken cancellationToken)
        {
            if (notification.User.GoogleAccount == null)
            {
                var verificationToken = notification.User.VerificationTokens.OrderByDescending(x => x.Id).First();
                await _emailService
                    .SendEmailVerificationMail(
                        notification.User.Language.Value,
                        verificationToken.Value,
                        notification.User.UserName.Value,
                        notification.User.Email.Value,
                        cancellationToken
                    );
            }
        }
    }
}

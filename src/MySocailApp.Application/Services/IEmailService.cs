using MySocailApp.Domain.AccountAggregate.ValueObjects;

namespace MySocailApp.Application.Services
{
    public interface IEmailService
    {
        Task SendEmailConfirmationMail(
            string token, int id, string userName, string email, CancellationToken cancellationToken = default
        );
        Task SendEmailConfirmationByTokenMail(
            EmailConfirmationToken emailVerificationToken, string userName, string email, CancellationToken cancellationToken = default
        );
    }
}

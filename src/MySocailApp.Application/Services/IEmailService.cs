using MySocailApp.Domain.AccountAggregate;

namespace MySocailApp.Application.Services
{
    public interface IEmailService
    {
        Task SendEmailConfirmationMail(
            string token, string id, string userName, string email, CancellationToken cancellationToken = default
        );
        Task SendEmailConfirmationByTokenMail(
            EmailConfirmationToken emailVerificationToken, string userName, string email, CancellationToken cancellationToken = default
        );
    }
}

using MySocailApp.Domain.AccountAggregate.ValueObjects;

namespace MySocailApp.Application.ApplicationServices
{
    public interface IEmailService
    {
        Task SendEmailConfirmationMail(string token, int id, string userName, string email, CancellationToken cancellationToken = default);
        Task SendEmailConfirmationByTokenMail(string language, EmailConfirmationToken token, string userName, string email, CancellationToken cancellationToken);
    }
}

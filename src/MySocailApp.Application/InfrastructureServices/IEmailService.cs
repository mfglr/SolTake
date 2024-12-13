using MySocailApp.Domain.AccountAggregate.ValueObjects;

namespace MySocailApp.Application.InfrastructureServices
{
    public interface IEmailService
    {
        Task SendEmailConfirmationMail(string token, int id, string userName, string email, CancellationToken cancellationToken = default);
        Task SendEmailConfirmationByTokenMail(string? language, string token, string userName, string email, CancellationToken cancellationToken);
        Task SendPasswordResetMail(string? language, string token, string email, CancellationToken cancellationToken);
    }
}

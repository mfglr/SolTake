namespace MySocailApp.Application.InfrastructureServices
{
    public interface IEmailService
    {
        Task SendEmailVerificationMail(string language, string token, string userName, string email, CancellationToken cancellationToken);
        Task SendResetPasswordMailMessage(string language, string token, string userName, string email, CancellationToken cancellationToken);
    }
}

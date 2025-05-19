using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Infrastructure.InfrastructureServices.Email.MailMessageFactories;
using System.Net.Mail;

namespace MySocailApp.Infrastructure.InfrastructureServices.Email
{
    public class EmailService(SmtpClient smtpClient, EmailVerificationMailMessageFactory emailVerificationMailMessageFactory, ResetPasswordMailMessgeFactory resetPasswordMailMessgeFactory) : IEmailService
    {
        private readonly EmailVerificationMailMessageFactory _emailVerificationMailMessageFactory = emailVerificationMailMessageFactory;
        private readonly ResetPasswordMailMessgeFactory _resetPasswordMailMessgeFactory = resetPasswordMailMessgeFactory;

        private readonly SmtpClient _smtpClient = smtpClient;

        public async Task SendEmailVerificationMail(string language, string token, string userName, string email, CancellationToken cancellationToken)
        {
            var mailMessage = await _emailVerificationMailMessageFactory.Create(language, token, userName, email, cancellationToken);
            await _smtpClient.SendMailAsync(mailMessage, cancellationToken);
        }

        public async Task SendResetPasswordMailMessage(string language, string token, string userName, string email, CancellationToken cancellationToken)
        {
            var mailMessage = await _resetPasswordMailMessgeFactory.Create(language,token, userName, email, cancellationToken);
            await _smtpClient.SendMailAsync(mailMessage, cancellationToken);
        }
    }
}

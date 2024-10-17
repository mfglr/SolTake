using MySocailApp.Application.ApplicationServices;
using MySocailApp.Core;
using MySocailApp.Infrastructure.ApplicationServices.Email.MailMessageFactories;
using System.Net.Mail;

namespace MySocailApp.Infrastructure.ApplicationServices.Email
{
    public class EmailService(MailMessageFactory messageFactory, SmtpClient smtpClient, EmailConfirmationMailMessageFactory emailConfirmationMailMessageFactory) : IEmailService
    {

        private readonly MailMessageFactory _messageFactory = messageFactory;
        private readonly EmailConfirmationMailMessageFactory _emailConfirmationMailMessageFactory = emailConfirmationMailMessageFactory;

        private readonly SmtpClient _smtpClient = smtpClient;

        public async Task SendEmailConfirmationMail(
            string token, int id, string userName, string email, CancellationToken cancellationToken = default
        )
        {
            var mailMessagge = await _messageFactory.CreateEmailConfirmationMailMessageAsync(token, id, userName, email, cancellationToken);
            await _smtpClient.SendMailAsync(mailMessagge, cancellationToken);
        }

        public async Task SendEmailConfirmationByTokenMail(string? language, string token, string userName, string email, CancellationToken cancellationToken)
        {
            await _smtpClient
                .SendMailAsync(
                    await _emailConfirmationMailMessageFactory
                        .Create(
                            language ?? Languages.EN,
                            token,
                            userName,
                            email,
                            cancellationToken
                        ),
                    cancellationToken
                );
        }
    }
}

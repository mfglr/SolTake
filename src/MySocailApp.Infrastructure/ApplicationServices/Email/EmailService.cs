using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.AccountAggregate.ValueObjects;
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
            var mailMessagge = await _messageFactory.CreateEmailConfirmationMailMessageAsync(
                token, id, userName, email, cancellationToken
            );
            await _smtpClient.SendMailAsync(mailMessagge, cancellationToken);
        }

        public async Task SendEmailConfirmationByTokenMail(string language,EmailConfirmationToken token, string userName, string email, CancellationToken cancellationToken)
        {
            await _smtpClient
                .SendMailAsync(
                    await _emailConfirmationMailMessageFactory
                        .Create(
                            language,
                            token.Token,
                            userName,
                            email,
                            cancellationToken
                        ),
                    cancellationToken
                );
        }
    }
}

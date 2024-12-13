using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Core;
using MySocailApp.Domain.AccountAggregate.Entities;
using MySocailApp.Infrastructure.InfrastructureServices.Email.MailMessageFactories;
using System.Net.Mail;

namespace MySocailApp.Infrastructure.InfrastructureServices.Email
{
    public class EmailService(MailMessageFactory messageFactory, SmtpClient smtpClient, EmailConfirmationMailMessageFactory emailConfirmationMailMessageFactory, ResetPasswordMailMessgeFactory resetPasswordMailMessageFactory) : IEmailService
    {
        private readonly MailMessageFactory _messageFactory = messageFactory;
        private readonly EmailConfirmationMailMessageFactory _emailConfirmationMailMessageFactory = emailConfirmationMailMessageFactory;
        private readonly ResetPasswordMailMessgeFactory _resetPasswordMailMessageFactory = resetPasswordMailMessageFactory;

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
                            language ?? Languages.DefaultLanguage,
                            token,
                            userName,
                            email,
                            cancellationToken
                        ),
                    cancellationToken
                );
        }

        public async Task SendPasswordResetMail(string token, Account account, CancellationToken cancellationToken)
        {
            //var mailMessage = await _resetPasswordMailMessageFactory
            //    .Create(
            //        account.Language,
            //        token,
            //        account.

            //    );
        }

        public Task SendPasswordResetMail(string? language, string token, string email, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
    }
}

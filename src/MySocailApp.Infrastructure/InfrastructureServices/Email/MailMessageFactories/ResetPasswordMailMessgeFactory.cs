using MySocailApp.Application.Configurations;
using MySocailApp.Domain.AccountAggregate.Entities;
using System.Net.Mail;

namespace MySocailApp.Infrastructure.InfrastructureServices.Email.MailMessageFactories
{
    public class ResetPasswordMailMessgeFactory(IEmailServiceSettings emailServiceSettings)
    {
        private readonly IEmailServiceSettings _emailServiceSettings = emailServiceSettings;

        private readonly static string _subjectTr = "Reset Your Password";
        private readonly static string _subjectEn = "Şifreni Sıfırla";
        private readonly static Dictionary<string, string> _subjects = new()
        {
            { "tr", _subjectTr },
            { "en", _subjectEn }
        };

        public async Task<MailMessage> Create(string token, Account account, CancellationToken cancellationToken)
        {
            using var file = File.OpenRead($"MailMessages/ResetPassword_{account.Language}.html");
            using var streamReader = new StreamReader(file);

            var body = await streamReader.ReadToEndAsync(cancellationToken);
            body = body.Replace("{user_name}", account.UserName);
            body = body.Replace("{token}", token);

            var message = new MailMessage()
            {
                IsBodyHtml = true,
                From = new MailAddress(_emailServiceSettings.SenderMail, _emailServiceSettings.DisplayName),
                Subject = _subjects[account.Language],
                Body = body
            };
            message.To.Add(new MailAddress(account.Email!));

            return message;
        }
    }
}

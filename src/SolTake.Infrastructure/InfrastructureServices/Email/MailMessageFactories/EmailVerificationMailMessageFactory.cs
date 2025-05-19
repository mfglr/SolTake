using MySocailApp.Application.Configurations;
using System.Net.Mail;

namespace MySocailApp.Infrastructure.InfrastructureServices.Email.MailMessageFactories
{
    public class EmailVerificationMailMessageFactory(IEmailServiceSettings emailServiceSettings)
    {
        private readonly IEmailServiceSettings _emailServiceSettings = emailServiceSettings;

        private readonly static Dictionary<string, string> _subjects = new()
        {
            { "tr", "Email Doğrulaması" },
            { "en", "Email Verification" }
        };

        public async Task<MailMessage> Create(string language,
           string token, string userName, string email, CancellationToken cancellationToken)
        {
            using var file = File.OpenRead($"MailMessages/EmailVerification_{language}.html");
            using var streamReader = new StreamReader(file);

            var body = await streamReader.ReadToEndAsync(cancellationToken);
            body = body.Replace("{userName}", userName);
            body = body.Replace("{token}", token);

            var message = new MailMessage()
            {
                IsBodyHtml = true,
                From = new MailAddress(_emailServiceSettings.SenderMail, _emailServiceSettings.DisplayName),
                Subject = _subjects[language],
                Body = body
            };
            message.To.Add(new MailAddress(email));

            return message;
        }
    }
}

using MySocailApp.Application.Configurations;
using System.Net.Mail;

namespace MySocailApp.Infrastructure.ApplicationServices.Email.MailMessageFactories
{
    public class EmailConfirmationMailMessageFactory(IEmailServiceSettings emailServiceSettings)
    {
        private readonly IEmailServiceSettings _emailServiceSettings = emailServiceSettings;

        private readonly static string _subjectTr = "Email Doğrulaması";
        private readonly static string _subjectEn = "Email Verification";
        private readonly static Dictionary<string, string> _subjects = new()
        {
            { "tr", _subjectTr },
            { "en", _subjectEn }
        };


        private readonly static string _content1Tr = "Merhaba {userName}! SolTake.com' a hoşgeldin!";
        private readonly static string _content1En = "Hi {userName}! Welcom to SolTake.com!";
        private readonly static Dictionary<string, string> _content1s = new()
        {
            { "tr", _content1Tr },
            { "en", _content1En }
        };
        private static string GetContent1(string Language, string userName) => _content1s[Language].Replace("{userName}", userName);

        private readonly static string _content2Tr = "Emailinizi onaylamak aşağıdaki kodunuz";
        private readonly static string _content2En = "Your code to confirm your email is";
        private readonly static Dictionary<string, string> _content2s = new()
        {
            { "tr", _content2Tr },
            { "en", _content2En }
        };

        public async Task<MailMessage> Create(string language,
           string code, string userName, string email, CancellationToken cancellationToken)
        {
            using var file = File.OpenRead("MailMessages/EmailConfirmationByToken.html");
            using var streamReader = new StreamReader(file);

            var body = await streamReader.ReadToEndAsync(cancellationToken);
            body = body.Replace("{content1}", GetContent1(language,userName));
            body = body.Replace("{content2}", _content2s[language]);
            body = body.Replace("{code}", code);

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

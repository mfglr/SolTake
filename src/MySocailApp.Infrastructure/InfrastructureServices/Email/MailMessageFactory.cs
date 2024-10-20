﻿using MySocailApp.Application.Configurations;
using System.Net.Mail;

namespace MySocailApp.Infrastructure.InfrastructureServices.Email
{
    public class MailMessageFactory(IEmailServiceSettings emailServiceSettings, IApplicationSettings applicationSettings)
    {

        private readonly IEmailServiceSettings _emailServiceSettings = emailServiceSettings;
        private readonly IApplicationSettings _applicationSettings = applicationSettings;

        public async Task<MailMessage> CreateEmailConfirmationMailMessageAsync(
            string token, int id, string userName, string email, CancellationToken cancellationToken = default)
        {

            using var bodyFile = File.OpenRead("MailMessages/EmailConfirmation.html");
            using var streamReader = new StreamReader(bodyFile);

            var body = await streamReader.ReadToEndAsync(cancellationToken);
            body = body.Replace("{applicationUrl}", _applicationSettings.ApplicationUrl);
            body = body.Replace("{userName}", userName);
            body = body.Replace("{token}", token);
            body = body.Replace("{id}", id.ToString());

            var message = new MailMessage()
            {
                IsBodyHtml = true,
                From = new MailAddress(_emailServiceSettings.SenderMail, _emailServiceSettings.DisplayName),
                Subject = EmailSubjects.EmailVerification,
                Body = body
            };
            message.To.Add(new MailAddress(email));
            return message;
        }
    }
}
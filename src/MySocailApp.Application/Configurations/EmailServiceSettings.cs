namespace MySocailApp.Application.Configurations
{
    public class EmailServiceSettings(string host, int port, string senderMail, string displayName, string password) : IEmailServiceSettings
    {
        public string Host { get; set; } = host;
        public int Port { get; set; } = port;
        public string SenderMail { get; set; } = senderMail;
        public string DisplayName { get; set; } = displayName;
        public string Password { get; set; } = password;
    }
}

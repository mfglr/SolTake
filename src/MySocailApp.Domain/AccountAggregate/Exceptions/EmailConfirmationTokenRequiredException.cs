using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class EmailConfirmationTokenRequiredException : AppException
    {
        private readonly static string _messageTr = "A token is required to confirm your email!";
        private readonly static string _messageEn = "Email' i onaylamak için token gereklidir!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public EmailConfirmationTokenRequiredException() : base((int)HttpStatusCode.BadRequest){}

    }
}

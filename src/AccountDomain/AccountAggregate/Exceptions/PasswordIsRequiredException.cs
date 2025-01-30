using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace AccountDomain.AccountAggregate.Exceptions
{
    public class PasswordIsRequiredException : AppException
    {
        private readonly static string _messageEn = "A password required";
        private readonly static string _messageTr = "Şifre gerekli!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public PasswordIsRequiredException() : base((int)HttpStatusCode.BadRequest)
        {
        }

    }
}

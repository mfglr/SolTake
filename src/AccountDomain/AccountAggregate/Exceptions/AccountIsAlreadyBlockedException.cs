using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace AccountDomain.Exceptions
{
    public class AccountIsAlreadyBlockedException : AppException
    {
        private readonly static string _messageEn = "You have already been blocked the user before!";
        private readonly static string _messageTr = "Kullanıcıyı daha önce zaten engelledin!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public AccountIsAlreadyBlockedException() : base((int)HttpStatusCode.NotFound) { }

        public override string GetErrorMessage(string culture) => _messages[culture];
    }
}

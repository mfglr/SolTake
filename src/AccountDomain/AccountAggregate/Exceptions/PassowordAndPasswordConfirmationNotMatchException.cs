using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace AccountDomain.Exceptions
{
    public class PassowordAndPasswordConfirmationNotMatchException : AppException
    {
        private readonly static string _messageEn = "Password and password confirmation do not match!";
        private readonly static string _messageTr = "Şifre ve şifre onayı uyuşmuyor!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public PassowordAndPasswordConfirmationNotMatchException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

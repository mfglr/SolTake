using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.UserAggregate.Exceptions
{
    public class UserHasBalanceException : AppException
    {
        private readonly static string _messageEn = "You have a balance in your account!";
        private readonly static string _messageTr = "Hesabınızda bakiye var!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public UserHasBalanceException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

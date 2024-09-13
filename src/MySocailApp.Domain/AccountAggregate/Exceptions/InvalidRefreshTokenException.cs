using MySocailApp.Core;
using MySocailApp.Core.Exceptions;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class InvalidRefreshTokenException : AppException
    {
        private readonly static string _messageEn = "Your session is over! You must log in again.";
        private readonly static string _messageTr = "Oturum süren doldu! Tekrar giriş yapmalısın.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidRefreshTokenException() : base(419){}
    }
}

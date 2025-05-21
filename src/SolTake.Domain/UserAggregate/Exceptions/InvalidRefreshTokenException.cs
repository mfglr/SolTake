using SolTake.Core;
using SolTake.Core.Exceptions;

namespace SolTake.Domain.UserAggregate.Exceptions
{
    public class InvalidRefreshTokenException : AppException
    {
        private readonly static string _messageEn = "Invalid refresh token or your session is over! You must log in again.";
        private readonly static string _messageTr = "Geçersiz yenileme anatarı ya da oturum süren doldu! Tekrar giriş yapmalısın.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidRefreshTokenException() : base(419) { }
    }
}

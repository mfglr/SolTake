using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace AccountDomain.AccountAggregate.Exceptions
{
    public class RefreshTokenIsRequiredException : AppException
    {
        private readonly static string _messageEn = "A refresh token to login is required!";
        private readonly static string _messageTr = "Giriş yapabilmek için yenileme anahtarı gereklidir!";

        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public RefreshTokenIsRequiredException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

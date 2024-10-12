using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class GoogleTokenNotValidException : AppException
    {
        private readonly static string _messageEn = "The token is not valid!";
        private readonly static string _messageTr = "Anahtar geçerli değil!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public GoogleTokenNotValidException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate.Exceptions
{
    public class InvalidTokenException : AppException
    {
        private readonly static string _messageTr = "Girdiğiniz kod hatalı ya da artık gecerli değil!";
        private readonly static string _messageEn = "The code is incorrect or no longer valid";

        private readonly static Dictionary<string, string> _messages = new()
        {
            { "tr", _messageTr },
            { "en", _messageEn },
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidTokenException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

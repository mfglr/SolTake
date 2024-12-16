using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate.Exceptions
{
    public class EmailIsAlreadyTakenException : AppException
    {
        private readonly static string _messageEn = "The email has been already taken!";
        private readonly static string _messageTr = "Email zaten kullanılıyor!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public EmailIsAlreadyTakenException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class EmailIsAlreadyTakenException : AppException
    {
        private readonly static string _messageEn = "The email has been already saved!";
        private readonly static string _messageTr = "Email zaten kayıtlı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public EmailIsAlreadyTakenException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AIModelAggregate.Exceptions
{
    public class InvalidSolValueException : AppException
    {
        private readonly static string _messageEn = "Invalid value!";
        private readonly static string _messageTr = "Geçersiz deger!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public InvalidSolValueException() : base((int)HttpStatusCode.BadRequest) { }

        public override string GetErrorMessage(string culture) => _messages[culture];
    }
}

using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.AIModelAggregate.Exceptions
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

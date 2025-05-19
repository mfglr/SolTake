using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.AppVersionAggregate.Exceptions
{
    public class InvalidVersionCodeException : AppException
    {
        private readonly static string _messageEn = "Invalid version code!";
        private readonly static string _messageTr = "Geçersiz versiyon kodu!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public InvalidVersionCodeException() : base((int)HttpStatusCode.BadRequest) { }

        public override string GetErrorMessage(string culture) => _messages[culture];
    }
}

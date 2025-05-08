using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AIModelAggregate.Exceptions
{
    public class AIModelNotFoundException : AppException
    {
        private readonly static string _messageEn = "An ai model not found";
        private readonly static string _messageTr = "Yz modeli bulunamadı";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public AIModelNotFoundException() : base((int)HttpStatusCode.NotFound) { }

        public override string GetErrorMessage(string culture) => _messages[culture];
    }
}

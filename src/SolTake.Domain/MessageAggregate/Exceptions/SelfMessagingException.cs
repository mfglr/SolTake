using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions
{
    public class SelfMessagingException : AppException
    {
        private readonly static string _messageEn = "You can't send messages to yourself!";
        private readonly static string _messageTr = "Kendine mesaj gönderemezsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public SelfMessagingException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

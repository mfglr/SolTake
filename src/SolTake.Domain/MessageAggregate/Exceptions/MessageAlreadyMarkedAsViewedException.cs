using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.MessageAggregate.Exceptions
{
    public class MessageAlreadyMarkedAsViewedException : AppException
    {
        private readonly static string _messageEn = "The state of this message have already been marked as viewed before.";
        private readonly static string _messageTr = "Bu mesajın durumu daha önce görüldü olarak işaratlenmiş.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public MessageAlreadyMarkedAsViewedException() : base((int)HttpStatusCode.BadRequest)
        {
        }
    }
}

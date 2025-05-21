using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.MessageAggregate.Exceptions
{
    public class MessageAlreadyMarktedAsReceivedException : AppException
    {
        private readonly static string _messageEn = "The state of this message have already been marked to receipted.";
        private readonly static string _messageTr = "Bu mesajın durumu daha önce ulaştırıldı olarak işaretlenmiş.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public MessageAlreadyMarktedAsReceivedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

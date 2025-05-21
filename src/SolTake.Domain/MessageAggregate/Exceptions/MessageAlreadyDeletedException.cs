using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.MessageAggregate.Exceptions
{
    public class MessageAlreadyDeletedException : AppException
    {
        private readonly static string _messageEn = "You have aldready delted this message before!.";
        private readonly static string _messageTr = "Bu mesaji daha önce sildin!.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public MessageAlreadyDeletedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

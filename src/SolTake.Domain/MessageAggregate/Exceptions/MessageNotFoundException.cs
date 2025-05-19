using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions
{
    public class MessageNotFoundException : AppException
    {
        private readonly static string _messageEn = "Message could not found!";
        private readonly static string _messageTr = "Mesaj bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public MessageNotFoundException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

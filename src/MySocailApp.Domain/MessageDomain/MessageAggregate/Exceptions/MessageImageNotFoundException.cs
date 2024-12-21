using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions
{
    public class MessageImageNotFoundException : AppException
    {
        private readonly static string _messageEn = "Message image could not found!";
        private readonly static string _messageTr = "Bu mesajın resmi bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public MessageImageNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}

using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageUserReceiveAggregate.Exceptions
{
    public class MessageAlreadyReceivedException : AppException
    {
        private readonly static string _messageEn = "The state of this message have already been marked to receipted.";
        private readonly static string _messageTr = "Bu mesajın durumu daha önce ulaştırıldı olarak işaretlenmiş.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public MessageAlreadyReceivedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

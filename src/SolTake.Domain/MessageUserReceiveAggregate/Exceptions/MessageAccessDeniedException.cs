using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageUserReceiveAggregate.Exceptions
{
    public class MessageAccessDeniedException : AppException
    {
        private readonly static string _messageEn = "You do not have permission to view this message!";
        private readonly static string _messageTr = "Bu mesajı görüntülemek için yetkiye sahip değilsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public MessageAccessDeniedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

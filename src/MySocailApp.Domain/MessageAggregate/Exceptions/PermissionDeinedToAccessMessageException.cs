using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageAggregate.Exceptions
{
    public class PermissionDeinedToAccessMessageException : AppException
    {
        private readonly static string _messageEn = "You can't access this message! You are not the owner or the receiver.";
        private readonly static string _messageTr = "Bu mesaj sahibi ya alıcısı olmadığın için mesajı okuyamazsın!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public PermissionDeinedToAccessMessageException() : base((int)HttpStatusCode.BadRequest){}
    }
}

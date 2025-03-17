using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageDomain.MessageUserRemoveAggregate.Exceptions
{
    public class PermissionDeniedToRemoveMessageException : AppException
    {
        private readonly static string _messageEn = "You can't delete this message. You are not the sender or the receiver!";
        private readonly static string _messageTr = "Bu mesajın sahibi ya da alıcısı olmadığın için silemezsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public PermissionDeniedToRemoveMessageException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

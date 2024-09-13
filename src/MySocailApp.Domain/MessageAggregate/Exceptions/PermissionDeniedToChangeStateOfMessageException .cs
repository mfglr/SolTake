using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageAggregate.Exceptions
{
    public class PermissionDeniedToChangeStateOfMessageException : AppException
    {
        private readonly static string _messageEn = "You can't change the state of this message!";
        private readonly static string _messageTr = "Bu mesajın durumunu değiştiremezsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public PermissionDeniedToChangeStateOfMessageException() : base((int)HttpStatusCode.BadRequest)
        {
        }
    }
}

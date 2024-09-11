using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageAggregate.Exceptions
{
    public class PermissionDeniedToRemoveMessageException : ClientSideException
    {
        private readonly static string _message = "You can't delete this message. You are not the sender or the receiver!";
        public PermissionDeniedToRemoveMessageException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageAggregate.Exceptions
{
    public class PermissionDeinedToAccessMessageException : ClientSideException
    {
        private readonly static string _message = "You can't access this message! You are not the owner or the receiver.";
        public PermissionDeinedToAccessMessageException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

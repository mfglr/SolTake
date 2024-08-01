using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageAggregate.Exceptions
{
    public class PermissionDeniedToChangeStateOfMessageException : ClientSideException
    {
        private readonly static string _message = "You can't change the state of this message!";
        public PermissionDeniedToChangeStateOfMessageException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}

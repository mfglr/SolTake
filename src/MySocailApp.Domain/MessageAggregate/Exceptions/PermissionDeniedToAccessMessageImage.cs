using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageAggregate.Exceptions
{
    public class PermissionDeniedToAccessMessageImage : ClientSideException
    {
        private readonly static string _message = "You cannot view this message image. You are not the sender or receiver of this message.";
        public PermissionDeniedToAccessMessageImage() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

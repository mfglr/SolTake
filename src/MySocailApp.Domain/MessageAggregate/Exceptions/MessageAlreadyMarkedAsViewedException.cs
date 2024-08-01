using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageAggregate.Exceptions
{
    public class MessageAlreadyMarkedAsViewedException : ClientSideException
    {
        private readonly static string _message = "The state of this message have already been marked as viewed before!";
        public MessageAlreadyMarkedAsViewedException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}

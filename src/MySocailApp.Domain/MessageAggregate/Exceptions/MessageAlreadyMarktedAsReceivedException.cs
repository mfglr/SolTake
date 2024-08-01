using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageAggregate.Exceptions
{
    public class MessageAlreadyMarktedAsReceivedException : ClientSideException
    {
        private readonly static string _message = "The state of this message have already been marked to receipted.";
        public MessageAlreadyMarktedAsReceivedException() : base(_message, (int)HttpStatusCode.BadRequest) { }
    }
}

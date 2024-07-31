using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.ConversationContext.MessageAggregate.Exceptions
{
    public class MessageNotFoundException : ClientSideException
    {
        private readonly static string _message = "Message could not found!";
        public MessageNotFoundException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

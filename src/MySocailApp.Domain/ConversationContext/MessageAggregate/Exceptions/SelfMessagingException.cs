using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.ConversationContext.MessageAggregate.Exceptions
{
    public class SelfMessagingException : ClientSideException
    {
        private readonly static string _message = "You can't message to yourself!";
        public SelfMessagingException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

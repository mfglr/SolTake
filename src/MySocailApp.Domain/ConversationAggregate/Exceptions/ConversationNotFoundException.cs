using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.ConversationAggregate.Exceptions
{
    public class ConversationNotFoundException : ClientSideException
    {
        private readonly static string _message = "Conversation could not found!";
        public ConversationNotFoundException() : base(_message, (int)HttpStatusCode.NotFound)
        {
        }
    }
}

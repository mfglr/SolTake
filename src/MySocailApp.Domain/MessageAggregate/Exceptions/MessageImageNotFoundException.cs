using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageAggregate.Exceptions
{
    public class MessageImageNotFoundException : ClientSideException
    {
        private readonly static string _message = "Message image could not found!";
        public MessageImageNotFoundException() : base(_message, (int)HttpStatusCode.NotFound){}
    }
}

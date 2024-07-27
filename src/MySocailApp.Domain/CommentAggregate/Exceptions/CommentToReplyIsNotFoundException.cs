using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.CommentAggregate.Exceptions
{
    public class CommentToReplyIsNotFoundException : ClientSideException
    {
        private readonly static string _message = "The comment could not be created! The comment you wanted to reply on was not found or deleted!";
        public CommentToReplyIsNotFoundException() : base(_message, (int)HttpStatusCode.NotFound)
        {
        }
    }
}

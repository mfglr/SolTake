using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.CommentAggregate.Exceptions
{
    public class CommentIsNotFoundException : ClientSideException
    {
        private readonly static string _message = "Comment was not found!";
        public CommentIsNotFoundException() : base(_message, (int)HttpStatusCode.BadRequest) { }
    }
}

using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.CommentAggregate.Exceptions
{
    public class NoCommentLikeException : ClientSideException
    {
        private readonly static string _message = "You didn't like the comment!";
        public NoCommentLikeException() : base(_message, (int)HttpStatusCode.BadRequest) { }
    }
}

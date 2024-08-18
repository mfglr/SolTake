using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.CommentAggregate.Exceptions
{
    public class PermissionDeniedToDeleteCommentException : ClientSideException
    {
        private readonly static string _message = "You can't delete this comment! You are not the owner.";
        public PermissionDeniedToDeleteCommentException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

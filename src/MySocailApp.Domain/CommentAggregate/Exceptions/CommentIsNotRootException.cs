using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.CommentAggregate.Exceptions
{
    public class CommentIsNotRootException : ClientSideException
    {
        private readonly static string _message = "The comment is not root! You can't reply this comment!";
        public CommentIsNotRootException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

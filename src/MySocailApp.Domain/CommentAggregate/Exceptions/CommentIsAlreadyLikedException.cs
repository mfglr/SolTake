using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.CommentAggregate.Exceptions
{
    public class CommentIsAlreadyLikedException : ClientSideException
    {
        private readonly static string _message = "You have been already liked the comment before!";
        public CommentIsAlreadyLikedException() : base(_message, (int)HttpStatusCode.BadRequest) { }
    }
}

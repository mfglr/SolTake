using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.CommentAggregate.Exceptions
{
    public class CommentNotFoundException : ClientSideException
    {
        private readonly static string _message = "Comment coluld not found! It may have been deleted after it was loaded.";
        public CommentNotFoundException() : base(_message, (int)HttpStatusCode.BadRequest) { }
    }
}

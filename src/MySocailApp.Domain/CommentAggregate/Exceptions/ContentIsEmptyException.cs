using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.CommentAggregate.Exceptions
{
    public class ContentIsEmptyException : ClientSideException
    {
        private readonly static string _message = "Comment must not be empty";
        public ContentIsEmptyException() : base(_message, (int)HttpStatusCode.BadRequest) { }
    }
}

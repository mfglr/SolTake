using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionCommentAggregate.Exceptions
{
    public class ContentToLongException : ClientSideException
    {
        private readonly static string _message = "A comment cannot be longer than 2200 characters!";
        public ContentToLongException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

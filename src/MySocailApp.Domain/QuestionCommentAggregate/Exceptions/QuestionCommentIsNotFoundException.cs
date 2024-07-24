using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionCommentAggregate.Exceptions
{
    public class QuestionCommentIsNotFoundException : ClientSideException
    {
        private readonly static string _message = "Comment was not found!";
        public QuestionCommentIsNotFoundException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

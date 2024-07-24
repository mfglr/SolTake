using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionCommentAggregate.Exceptions
{
    public class NoQuestionCommentLikeException : ClientSideException
    {
        private readonly static string _message = "You didn't like the comment!";
        public NoQuestionCommentLikeException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

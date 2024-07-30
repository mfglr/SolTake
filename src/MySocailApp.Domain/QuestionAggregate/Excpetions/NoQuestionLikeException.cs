using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class NoQuestionLikeException : ClientSideException
    {
        private readonly static string _message = "You must like the question first to dislike it!";
        public NoQuestionLikeException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

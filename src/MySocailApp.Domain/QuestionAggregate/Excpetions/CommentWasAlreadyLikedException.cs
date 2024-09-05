using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class CommentWasAlreadyLikedException : ClientSideException
    {
        private readonly static string _message = "You have already like the comment before!";
        public CommentWasAlreadyLikedException() : base(_message, (int)HttpStatusCode.BadRequest) { }
    }
}

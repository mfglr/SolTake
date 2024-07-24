using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionCommentAggregate.Exceptions
{
    public class QuestionCommentIsAlreadyLikedException : ClientSideException
    {
        private readonly static string _message = "You have been already liked the comment before!";
        public QuestionCommentIsAlreadyLikedException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class QuestionWasAlreadyLikedException : ClientSideException
    {
        private readonly static string _message = "You have already liked the question before!";
        public QuestionWasAlreadyLikedException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

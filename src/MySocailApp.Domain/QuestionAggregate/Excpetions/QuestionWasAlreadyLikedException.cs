using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class QuestionWasAlreadyLikedException : ClientSideException
    {
        private readonly static string _message = "You have been already liked the question!";
        public QuestionWasAlreadyLikedException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

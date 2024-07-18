using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class UnableToSolveYourQuestionException : ClientSideException
    {
        private readonly static string _message = "You can't solve your questions!";
        public UnableToSolveYourQuestionException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

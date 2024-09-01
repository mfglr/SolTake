using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionDownvotedBeforeException : ClientSideException
    {
        private readonly static string _message = "You have downvoted on the solution before!";
        public SolutionDownvotedBeforeException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

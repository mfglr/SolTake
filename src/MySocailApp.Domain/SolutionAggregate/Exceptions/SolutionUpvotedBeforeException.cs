using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionUpvotedBeforeException : ClientSideException
    {
        private readonly static string _message = "You have upvoted on the solution before!";
        public SolutionUpvotedBeforeException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

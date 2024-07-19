using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class UnableToVoteForYourSolutions : ClientSideException
    {
        private readonly static string _message = "You can't vote for your solutions!";
        public UnableToVoteForYourSolutions() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

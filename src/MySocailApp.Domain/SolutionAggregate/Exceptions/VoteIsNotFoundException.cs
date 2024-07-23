using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class VoteIsNotFoundException : ClientSideException
    {
        private readonly static string _message = "Vote was not found!";
        public VoteIsNotFoundException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

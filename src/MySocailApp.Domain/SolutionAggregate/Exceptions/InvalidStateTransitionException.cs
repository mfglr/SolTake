using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class InvalidStateTransitionException : ClientSideException
    {
        private readonly static string _message = "Only solutions with a 'pending' state can be marked as 'correct' or 'incorrect'";
        public InvalidStateTransitionException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

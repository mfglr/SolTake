using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionIsNotFoundException : ClientSideException
    {
        private readonly static string _message = "Solution is not found!";
        public SolutionIsNotFoundException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

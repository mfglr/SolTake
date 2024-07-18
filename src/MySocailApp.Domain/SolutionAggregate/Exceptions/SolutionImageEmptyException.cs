using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionImageEmptyException : ClientSideException
    {
        private readonly static string _message = "A solution image could not be empty!";
        public SolutionImageEmptyException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

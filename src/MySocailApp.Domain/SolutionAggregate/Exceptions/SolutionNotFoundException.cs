using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionNotFoundException : ClientSideException
    {
        private readonly static string _message = "Solution could not be found! It may have been deleted after it was loaded.";
        public SolutionNotFoundException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

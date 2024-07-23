using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionImageIsNotFoundException : ClientSideException
    {
        private readonly static string _message = "Solution image was not found!";
        public SolutionImageIsNotFoundException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}

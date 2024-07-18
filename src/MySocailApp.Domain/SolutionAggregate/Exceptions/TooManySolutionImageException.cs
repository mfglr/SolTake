using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class TooManySolutionImageException : ClientSideException
    {
        private readonly static string _message = "You can upload up to 10 image per solution";
        public TooManySolutionImageException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

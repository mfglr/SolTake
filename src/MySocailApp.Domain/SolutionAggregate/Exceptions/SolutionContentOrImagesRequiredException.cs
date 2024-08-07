using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionContentOrImagesRequiredException : ClientSideException
    {
        private readonly static string _message = "You must upload images or type something about questions!";
        public SolutionContentOrImagesRequiredException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

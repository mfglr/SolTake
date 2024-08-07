using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionContentLengthExceededException : ClientSideException
    {
        private readonly static string _message = $"The content length exceeds the allowed maximum limit of {SolutionContent.MaxSoluiontContentLength} characters.";
        public SolutionContentLengthExceededException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

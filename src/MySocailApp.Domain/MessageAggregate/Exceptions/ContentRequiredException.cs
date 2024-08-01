using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageAggregate.Exceptions
{
    public class ContentRequiredException : ClientSideException
    {
        private readonly static string _message = "A message can't be empty! A content or an image is required!";
        public ContentRequiredException() : base(_message, (int)HttpStatusCode.BadRequest) { }
    }
}

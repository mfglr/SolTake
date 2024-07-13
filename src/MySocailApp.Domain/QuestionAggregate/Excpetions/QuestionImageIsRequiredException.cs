using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class QuestionImageIsRequiredException : ClientSideException
    {
        private readonly static string _message = "You must upload at least an image!";
        public QuestionImageIsRequiredException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}

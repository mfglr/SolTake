using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class QuestionImageIsNotFoundException : ClientSideException
    {
        private readonly static string _message = "Question image is not found!";
        public QuestionImageIsNotFoundException() : base(_message, (int)HttpStatusCode.NotFound){}
    }
}

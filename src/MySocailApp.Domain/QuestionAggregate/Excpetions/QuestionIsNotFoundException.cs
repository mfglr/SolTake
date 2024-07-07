using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class QuestionIsNotFoundException : ClientSideException
    {
        private readonly static string _message = "Question is not found!";
        public QuestionIsNotFoundException() : base(_message, (int)HttpStatusCode.NotFound)
        {
        }
    }
}

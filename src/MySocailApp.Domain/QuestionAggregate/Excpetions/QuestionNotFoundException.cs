using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class QuestionNotFoundException : ClientSideException
    {
        private readonly static string _message = "Question could not be found! It may have been deleted after it was loaded.";
        public QuestionNotFoundException() : base(_message, (int)HttpStatusCode.NotFound){}
    }
}

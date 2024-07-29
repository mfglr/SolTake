using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class QuestionImageNotFoundException : ClientSideException
    {
        private readonly static string _message = "Question image could not be found!";
        public QuestionImageNotFoundException() : base(_message, (int)HttpStatusCode.NotFound){}
    }
}

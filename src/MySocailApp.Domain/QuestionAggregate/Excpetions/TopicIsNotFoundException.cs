using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class TopicIsNotFoundException : ClientSideException
    {
        private readonly static string _message = "Topic is not found!";
        public TopicIsNotFoundException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}

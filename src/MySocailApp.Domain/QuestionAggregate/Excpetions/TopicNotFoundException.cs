using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class TopicNotFoundException : ClientSideException
    {
        private readonly static string _message = "Topic could not be found!";
        public TopicNotFoundException() : base(_message, (int)HttpStatusCode.NotFound){}
    }
}

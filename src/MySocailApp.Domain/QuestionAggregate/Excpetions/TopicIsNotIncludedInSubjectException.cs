using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class TopicIsNotIncludedInSubjectException : ClientSideException
    {
        private readonly static string _message = "Some topics are not included in the topic!";
        public TopicIsNotIncludedInSubjectException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}

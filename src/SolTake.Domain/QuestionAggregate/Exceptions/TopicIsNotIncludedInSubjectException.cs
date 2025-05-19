using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Exceptions
{
    public class TopicIsNotIncludedInSubjectException : AppException
    {
        private readonly static string _messageEn = "Some topics are not included in the subject!";
        private readonly static string _messageTr = "Seçtiğin konulardan bazıları seçtiğin derse ait değil!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public TopicIsNotIncludedInSubjectException() : base((int)HttpStatusCode.BadRequest)
        {
        }
    }
}

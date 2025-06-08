using SolTake.Core;
using SolTake.Core.Exceptions;
using SolTake.Domain.QuestionAggregate.ValueObjects;
using System.Net;

namespace SolTake.Domain.QuestionAggregate.Exceptions
{
    public class QuestionTopicLengthEceededException : AppException
    {
        private readonly static string _messageEn = $"The topic length exceeds the allowed maximum limit of {QuestionTopic.MaxLength} characters.";
        private readonly static string _messageTr = $"Konu {QuestionTopic.MaxLength} karakterden daha fazla olamaz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public QuestionTopicLengthEceededException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

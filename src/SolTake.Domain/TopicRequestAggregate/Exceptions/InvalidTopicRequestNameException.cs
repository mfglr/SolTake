using SolTake.Core;
using SolTake.Core.Exceptions;
using SolTake.Domain.TopicRequestAggregate.ValueObjects;
using System.Net;

namespace SolTake.Domain.TopicRequestAggregate.Exceptions
{
    public class InvalidTopicRequestNameException : AppException
    {
        private readonly static string _messageEn = $"Invalid topic name. A topic name must be greater than {TopicName.MinLength} characters and be less than {TopicName.MaxLength} characters.";
        private readonly static string _messageTr = $"Geçersiz konu adı. Bir konu adı {TopicName.MaxLength} karakterden fazla ve {TopicName.MaxLength} karakterden az olmalıdır.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidTopicRequestNameException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

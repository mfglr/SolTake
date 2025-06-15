using SolTake.Core;
using SolTake.Core.Exceptions;
using SolTake.Domain.TopicAggregate.Entities;
using System.Net;

namespace SolTake.Domain.TopicRequestAggregate.Exceptions
{
    public class TopicRequestNameLengthExceededException : AppException
    {
        private readonly static string _messageEn = $"A topic length exceeds the allowed maximum limit of {Topic.MaxLength} characters.";
        private readonly static string _messageTr = $"Konu {Topic.MaxLength} karakterden daha fazla olamaz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public TopicRequestNameLengthExceededException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

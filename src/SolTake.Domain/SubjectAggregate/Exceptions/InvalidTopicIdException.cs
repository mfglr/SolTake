using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.SubjectAggregate.Exceptions
{
    public class InvalidTopicIdException : AppException
    {
        private static readonly string _messageEn = "A topic id must bigger than 0!";
        private static readonly string _messageTr = "Bir konunun id' si 0 dan büyük olmalıdır!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public InvalidTopicIdException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

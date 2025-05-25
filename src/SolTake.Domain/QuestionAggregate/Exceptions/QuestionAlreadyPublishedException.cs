using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.QuestionAggregate.Exceptions
{
    public class QuestionAlreadyPublishedException : AppException
    {
        private readonly static string _messageEn = "The question has already been published before!";
        private readonly static string _messageTr = "Bu soru daha önce yayınlandı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public QuestionAlreadyPublishedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

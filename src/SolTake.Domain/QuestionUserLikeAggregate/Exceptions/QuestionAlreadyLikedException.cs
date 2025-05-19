using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionUserLikeAggregate.Exceptions
{
    public class QuestionAlreadyLikedException : AppException
    {
        private readonly static string _messageEn = "You have already liked the question before!";
        private readonly static string _messageTr = "Bu soruyu daha önce beğendin!";

        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public QuestionAlreadyLikedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

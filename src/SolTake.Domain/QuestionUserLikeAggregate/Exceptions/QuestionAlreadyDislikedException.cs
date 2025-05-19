using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionUserLikeAggregate.Exceptions
{
    public class QuestionAlreadyDislikedException : AppException
    {
        private readonly static string _messageEn = "You have already removed the like from the question or never liked the question!";
        private readonly static string _messageTr = "Sorudan beğeniyi zaten kaldırdın ya da soruyu hiç beğenmedin!";

        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public QuestionAlreadyDislikedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

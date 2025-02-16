using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Exceptions
{
    public class QuestionAlreadyDislikedException : AppException
    {
        private readonly static string _messageEn = "You have already removed the like from the question!";
        private readonly static string _messageTr = "Sorudan beğeniyi zaten kaldırdın!";

        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public QuestionAlreadyDislikedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

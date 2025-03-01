using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Exceptions
{
    public class QuestionWasAlreadyLikedException : AppException
    {
        private readonly static string _messageEn = "You have already liked the question before!";
        private readonly static string _messageTr = "Bu soruyu zaten beğendin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public QuestionWasAlreadyLikedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

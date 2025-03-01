using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Exceptions
{
    public class PermissionDeniedToDeleteQuestionException : AppException
    {
        private readonly static string _messageEn = "You can't delete this message! You are not the owner of this question!";
        private readonly static string _messageTr = "Bu sorunun sahibi değilsin! Soruyu silemezsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public PermissionDeniedToDeleteQuestionException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using System.Net;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Exceptions
{
    public class TooManyQuestionMediasException : AppException
    {
        private readonly static string _messageEn = $"You can upload up to {Question.MaxMediaCountPerQuestion} medias per question!";
        private readonly static string _messageTr = $"Bir soru için en fazla {Question.MaxMediaCountPerQuestion} media yükleyebilirsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public TooManyQuestionMediasException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

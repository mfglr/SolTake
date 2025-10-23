using SolTake.Core;
using SolTake.Core.Exceptions;
using SolTake.QuestionService.Domain.Entities;
using System.Net;

namespace SolTake.QuestionService.Domain.Exceptions
{
    internal class TooManyQuestionTopicsException : AppException
    {
        private readonly static string _messageEn = $"A question can have at most {Question.MaxTopicsPerQuestion} topics.";
        private readonly static string _messageTr = $"Bir sorunun en fazla {Question.MaxTopicsPerQuestion} konusu olabilir.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public TooManyQuestionTopicsException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

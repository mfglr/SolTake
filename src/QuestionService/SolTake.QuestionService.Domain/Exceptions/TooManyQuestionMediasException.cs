using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;
using SolTake.QuestionService.Domain.Entities;

namespace SolTake.QuestionService.Domain.Exceptions
{
    public class TooManyQuestionMediasException : AppException
    {
        private readonly static string _messageEn = $"You can upload up to {Question.MaxMediaPerQuestion} medias per question!";
        private readonly static string _messageTr = $"Bir soru için en fazla {Question.MaxMediaPerQuestion} media yükleyebilirsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public TooManyQuestionMediasException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

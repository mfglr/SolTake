using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using System.Net;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Excpetions
{
    public class TooManyQuestionImagesException : AppException
    {
        private readonly static string _messageEn = $"You can upload up to {Question.MaxImageCountPerQuestion} images per question!";
        private readonly static string _messageTr = $"Bir soru için en fazla {Question.MaxImageCountPerQuestion} resim yükleyebilirsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public TooManyQuestionImagesException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

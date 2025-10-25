using SolTake.Core;
using SolTake.Core.Exceptions;
using SolTake.QuestionService.Domain.ValueObjects;
using System.Net;

namespace SolTake.QuestionService.Domain.Exceptions
{
    public class InvalidExamNameException : AppException
    {
        private readonly static string _messageEn = $"Invalid exam name. An exam name must be greater than {QuestionExamName.MinLength} characters and be less than {QuestionExamName.MaxLength} characters.";
        private readonly static string _messageTr = $"Geçersiz sınav adı. Bir sınav adı {QuestionExamName.MaxLength} karakterden fazla ve {QuestionExamName.MaxLength} karakterden az olmalıdır.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidExamNameException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

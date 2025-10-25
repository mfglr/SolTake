using SolTake.Core;
using SolTake.Core.Exceptions;
using SolTake.QuestionService.Domain.ValueObjects;
using System.Net;

namespace SolTake.QuestionService.Domain.Exceptions
{
    public class InvalidQuestionSubjectNameException : AppException
    {
        private readonly static string _messageEn = $"Invalid subject name. A subject name must be greater than {QuestionSubjectName.MinLength} characters and be less than {QuestionSubjectName.MaxLength} characters.";
        private readonly static string _messageTr = $"Geçersiz ders adı. Bir ders adı {QuestionSubjectName.MaxLength} karakterden fazla ve {QuestionSubjectName.MaxLength} karakterden az olmalıdır.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidQuestionSubjectNameException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.ExamService.Domain
{
    public class InvalidExamNameException : AppException
    {
        private readonly static string _messageEn = $"Invalid exam name. An exam name must be greater than {ExamName.MinLength} characters and be less than {ExamName.MaxLength} characters.";
        private readonly static string _messageTr = $"Geçersiz sınav adı. Bir sınav adı {ExamName.MaxLength} karakterden fazla ve {ExamName.MaxLength} karakterden az olmalıdır.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidExamNameException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

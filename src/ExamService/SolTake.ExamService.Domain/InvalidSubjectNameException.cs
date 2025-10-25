using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.ExamService.Domain
{
    public class InvalidSubjectNameException : AppException
    {
        private readonly static string _messageEn = $"Invalid subject name. A subject name must be greater than {ExamSubject.MinLength} characters and be less than {ExamSubject.MaxLength} characters.";
        private readonly static string _messageTr = $"Geçersiz ders adı. Bir ders adı {ExamSubject.MaxLength} karakterden fazla ve {ExamSubject.MaxLength} karakterden az olmalıdır.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidSubjectNameException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

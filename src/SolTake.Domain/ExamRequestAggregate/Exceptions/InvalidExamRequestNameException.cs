using SolTake.Core;
using SolTake.Core.Exceptions;
using SolTake.Domain.ExamRequestAggregate.ValueObjects;
using System.Net;

namespace SolTake.Domain.ExamRequestAggregate.Exceptions
{
    public class InvalidExamRequestNameException : AppException
    {
        private readonly static string _messageEn = $"Invalid exam name. An exam name must be greater than {ExamRequestName.MinLength} characters and be less than {ExamRequestName.MaxLength} characters.";
        private readonly static string _messageTr = $"Geçersiz sınav adı. Bir sınav adı {ExamRequestName.MaxLength} karakterden fazla ve {ExamRequestName.MaxLength} karakterden az olmalıdır.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidExamRequestNameException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

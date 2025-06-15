using SolTake.Core;
using SolTake.Core.Exceptions;
using SolTake.Domain.ExamRequestAggregate.ValueObjects;
using System.Net;

namespace SolTake.Domain.ExamRequestAggregate.Exceptions
{
    public class InvalidExamRequestInitialismException : AppException
    {
        private readonly static string _messageEn = $"Invalid initialism. An initialism must be greater than {ExamRequestInitialism.MinLength} characters and be less than {ExamRequestInitialism.MaxLength} characters.";
        private readonly static string _messageTr = $"Geçersiz kısaltma. Kısaltma {ExamRequestInitialism.MaxLength} karakterden fazla ve {ExamRequestInitialism.MaxLength} karakterden az olmalıdır.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidExamRequestInitialismException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

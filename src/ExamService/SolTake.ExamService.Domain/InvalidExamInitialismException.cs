using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.ExamService.Domain
{
    public class InvalidExamInitialismException : AppException
    {
        private readonly static string _messageEn = $"Invalid initialism. An initialism must be greater than {ExamInitialism.MinLength} characters and be less than {ExamInitialism.MaxLength} characters.";
        private readonly static string _messageTr = $"Geçersiz kısaltma. Kısaltma {ExamInitialism.MaxLength} karakterden fazla ve {ExamInitialism.MaxLength} karakterden az olmalıdır.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidExamInitialismException() : base((int)HttpStatusCode.BadRequest){}
    }
}

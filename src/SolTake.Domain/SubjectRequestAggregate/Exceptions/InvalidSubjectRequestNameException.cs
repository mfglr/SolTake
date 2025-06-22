using SolTake.Core;
using SolTake.Core.Exceptions;
using SolTake.Domain.SubjectRequestAggregate.ValueObjects;
using System.Net;

namespace SolTake.Domain.SubjectRequestAggregate.Exceptions
{
    public class InvalidSubjectRequestNameException : AppException
    {
        private readonly static string _messageEn = $"Invalid subject name. An subject name must be greater than {SubjectName.MinLength} characters and be less than {SubjectName.MaxLength} characters.";
        private readonly static string _messageTr = $"Geçersiz sınav adı. Bir sınav adı {SubjectName.MaxLength} karakterden fazla ve {SubjectName.MaxLength} karakterden az olmalıdır.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidSubjectRequestNameException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

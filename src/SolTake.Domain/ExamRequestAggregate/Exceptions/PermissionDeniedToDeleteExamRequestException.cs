using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.ExamRequestAggregate.Exceptions
{
    public class PermissionDeniedToDeleteExamRequestException : AppException
    {
        private readonly static string _messageEn = "You do not have permission to delete this exam request!";
        private readonly static string _messageTr = "Bu sınav oluşturma isteğini silmeye yetkiniz yok!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public PermissionDeniedToDeleteExamRequestException() : base((int)HttpStatusCode.NotFound) { }
    }
}

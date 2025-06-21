using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.SubjectRequestAggregate.Exceptions
{
    public class PermissionDeniedToDeleteSubjectRequestException : AppException
    {
        private readonly static string _messageEn = "You do not have permission to delete this subject request!";
        private readonly static string _messageTr = "Bu ders oluşturma isteğini silmeye yetkiniz yok!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public PermissionDeniedToDeleteSubjectRequestException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

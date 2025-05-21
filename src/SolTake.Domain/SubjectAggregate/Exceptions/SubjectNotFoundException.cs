using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.SubjectAggregate.Exceptions
{
    public class SubjectNotFoundException : AppException
    {
        private static readonly string _messageEn = "Subject could not be found!";
        private static readonly string _messageTr = "Ders bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public SubjectNotFoundException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

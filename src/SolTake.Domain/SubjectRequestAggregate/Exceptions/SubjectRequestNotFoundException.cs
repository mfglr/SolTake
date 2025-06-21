using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.SubjectRequestAggregate.Exceptions
{
    public class SubjectRequestNotFoundException : AppException
    {
        private static readonly string _messageEn = "Request to create subject could not be found!";
        private static readonly string _messageTr = "Ders oluşturma isteği bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public SubjectRequestNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}

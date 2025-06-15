using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.ExamRequestAggregate.Exceptions
{
    public class ExamRequestNotFoundException : AppException
    {
        private readonly static string _messageEn = "A request to create exam has been not found!";
        private readonly static string _messageTr = "Bir sınav oluşturma isteği bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public ExamRequestNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}

using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.QuestionUserComplaintAggregate.Exceptions
{
    public class QuestionUserComplaintNotFoundException : AppException
    {
        private readonly static string _messageEn = "A complaint could not be found!";
        private readonly static string _messageTr = "Şikayet bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public QuestionUserComplaintNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}

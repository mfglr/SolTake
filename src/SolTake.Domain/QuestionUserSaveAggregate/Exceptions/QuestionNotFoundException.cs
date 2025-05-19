using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionUserSaveAggregate.Exceptions
{
    public class QuestionNotFoundException : AppException
    {
        private readonly static string _messageEn = "Question could not be found!";
        private readonly static string _messageTr = "Soru bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public QuestionNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}

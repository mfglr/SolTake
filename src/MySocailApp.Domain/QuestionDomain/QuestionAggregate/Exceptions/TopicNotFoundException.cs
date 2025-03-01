using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionDomain.QuestionAggregate.Exceptions
{
    public class TopicNotFoundException : AppException
    {
        private readonly static string _messageEn = "Topic could not be found!";
        private readonly static string _messageTr = "Konu bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public TopicNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}

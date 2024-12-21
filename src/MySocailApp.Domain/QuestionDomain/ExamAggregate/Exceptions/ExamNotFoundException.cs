using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionDomain.ExamAggregate.Exceptions
{
    public class ExamNotFoundException : AppException
    {
        private readonly static string _messageEn = "Exam could not be found";
        private readonly static string _messageTr = "Sınav bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public ExamNotFoundException() : base((int)HttpStatusCode.NotFound)
        {
        }
    }
}

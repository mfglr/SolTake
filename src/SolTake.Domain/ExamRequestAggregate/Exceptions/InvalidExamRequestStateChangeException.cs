using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.ExamRequestAggregate.Exceptions
{
    public class InvalidExamRequestStateChangeException : AppException
    {
        private readonly static string _messageEn = "Invalid state change!";
        private readonly static string _messageTr = "Gecersiz durum değişimi!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidExamRequestStateChangeException() : base((int)HttpStatusCode.NotFound){}
    }
}

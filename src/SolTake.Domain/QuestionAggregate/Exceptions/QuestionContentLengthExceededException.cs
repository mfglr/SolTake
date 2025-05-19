using MySocailApp.Domain.QuestionAggregate.ValueObjects;
using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Exceptions
{
    public class QuestionContentLengthExceededException : AppException
    {
        private readonly static string _messageEn = $"The content length exceeds the allowed maximum limit of {QuestionContent.MaxSoluiontContentLength} characters.";
        private readonly static string _messageTr = $"Sorunun içeriği {QuestionContent.MaxSoluiontContentLength} karakterden daha fazla olamaz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public QuestionContentLengthExceededException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

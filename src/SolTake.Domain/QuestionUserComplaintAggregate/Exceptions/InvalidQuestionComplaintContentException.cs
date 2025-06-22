using SolTake.Core;
using SolTake.Core.Exceptions;
using SolTake.Domain.QuestionUserComplaintAggregate.ValueObjects;
using System.Net;

namespace SolTake.Domain.QuestionUserComplaintAggregate.Exceptions
{
    public class InvalidQuestionComplaintContentException : AppException
    {
        private readonly static string _messageEn = $"Complaints about questions must be greater than {QuestionComplaintContent.MinLength} characters and be less than {QuestionComplaintContent.MaxLength} characters.";
        private readonly static string _messageTr = $"Soru hakkındaki şikayetler {QuestionComplaintContent.MaxLength} karakterden fazla ve {QuestionComplaintContent.MaxLength} karakterden az olmalıdır.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidQuestionComplaintContentException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

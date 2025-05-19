using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Exceptions
{
    public class QuestionVideoDurationException : AppException
    {
        private readonly static string _messageEn = "The duration of the video cannot exceed 5 minutes!";
        private readonly static string _messageTr = "Videonun süresi 5 dakikadan uzun olamaz!";

        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public QuestionVideoDurationException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

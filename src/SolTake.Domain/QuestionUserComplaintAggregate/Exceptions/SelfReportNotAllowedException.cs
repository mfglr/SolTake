using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.QuestionUserComplaintAggregate.Exceptions
{
    public class SelfReportNotAllowedException : AppException
    {
        private readonly static string _messageEn = $"You cannot report your own question.";
        private readonly static string _messageTr = $"Kendi sorunu şikayet edemezsin.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public SelfReportNotAllowedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

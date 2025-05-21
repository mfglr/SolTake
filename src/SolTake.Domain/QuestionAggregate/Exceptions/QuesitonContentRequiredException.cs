using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.QuestionAggregate.Exceptions
{
    public class QuesitonContentRequiredException : AppException
    {
        private readonly static string _messageEn = "You must upload at least one piece of media or write something about the question!";
        private readonly static string _messageTr = "Soruyla ilgili en az bir media yüklemi ya da bir şeyler yazmalısın!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public QuesitonContentRequiredException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

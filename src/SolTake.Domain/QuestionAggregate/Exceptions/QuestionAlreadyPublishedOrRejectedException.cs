using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.QuestionAggregate.Exceptions
{
    public class QuestionAlreadyPublishedOrRejectedException : AppException
    {
        private readonly static string _messageEn = "The question has already been published or rejected before!";
        private readonly static string _messageTr = "Bu soru daha önce yayınlandı ya da reddedildi!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public QuestionAlreadyPublishedOrRejectedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

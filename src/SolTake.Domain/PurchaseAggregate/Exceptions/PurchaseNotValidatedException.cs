using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.PurchaseAggregate.Exceptions
{
    public class PurchaseNotValidatedException : AppException
    {
        private readonly static string _messageEn = "The purchase could not be validated!";
        private readonly static string _messageTr = "Satın alma doğrulanamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public PurchaseNotValidatedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.PurchaseAggregate.Exceptions
{
    public class InvalidPurchaseState : AppException
    {
        private readonly static string _messageEn = "Purchase status is invalid!";
        private readonly static string _messageTr = "Satın alma durumu geçersiz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public InvalidPurchaseState() : base((int)HttpStatusCode.BadRequest) { }
    }
}

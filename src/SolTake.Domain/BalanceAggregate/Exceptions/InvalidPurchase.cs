using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.BalanceAggregate.Exceptions
{
    public class InvalidPurchase : AppException
    {
        private readonly static string _messageEn = "Invalid purchase!";
        private readonly static string _messageTr = "Geçersiz satın alma!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public InvalidPurchase() : base((int)HttpStatusCode.BadRequest) { }
    }
}

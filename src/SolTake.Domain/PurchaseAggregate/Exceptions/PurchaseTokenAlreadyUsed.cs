using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.PurchaseAggregate.Exceptions
{
    public class PurchaseTokenAlreadyUsed : AppException
    {
        private readonly static string _messageEn = "The token has been already used!";
        private readonly static string _messageTr = "Bu token daha önce kullanılmış!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public PurchaseTokenAlreadyUsed() : base((int)HttpStatusCode.BadRequest) { }
    }
}

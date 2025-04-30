using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.BalanceDomain.TransactionAggregate.Exceptions
{
    public class WalletNotFoundException : AppException
    {
        private readonly static string _messageEn = "You have not a wallet!";
        private readonly static string _messageTr = "Bir cüzdanın yok!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public WalletNotFoundException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

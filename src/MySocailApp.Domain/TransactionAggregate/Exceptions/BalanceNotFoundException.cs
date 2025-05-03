using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.TransactionAggregate.Exceptions
{
    public class BalanceNotFoundException : AppException
    {
        private readonly static string _messageEn = "Not found a balance which belongs to you!";
        private readonly static string _messageTr = "Sana ait bir bakiye bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public BalanceNotFoundException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

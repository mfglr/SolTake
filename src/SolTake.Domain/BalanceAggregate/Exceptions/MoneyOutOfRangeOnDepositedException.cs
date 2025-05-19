using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.BalanceAggregate.Exceptions
{
    internal class MoneyOutOfRangeOnDepositedException : AppException
    {
        private readonly static string _messageEn = "The amount to be deposited must exceed zero!";
        private readonly static string _messageTr = "Yatırılacak tutar sıfırdan büyük olmalıdır.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public MoneyOutOfRangeOnDepositedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

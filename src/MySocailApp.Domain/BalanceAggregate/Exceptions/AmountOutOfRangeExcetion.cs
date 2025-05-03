using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.BalanceAggregate.Exceptions
{
    public class AmountOutOfRangeExcetion : AppException
    {
        private readonly static string _messageEn = "Amount musn' t be less than 0!";
        private readonly static string _messageTr = "Miktar 0' dan küçük olamaz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public AmountOutOfRangeExcetion() : base((int)HttpStatusCode.BadRequest) { }
    }
}

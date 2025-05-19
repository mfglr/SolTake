using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class InsufficientFundsException : AppException
    {
        private readonly static string _messageEn = "Insufficient funds!";
        private readonly static string _messageTr = "Yetersiz bakiye!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public InsufficientFundsException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

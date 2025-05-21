using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.UserUserBlockAggregate.Exceptions
{
    public class UserUserBlockNotFouncException : AppException
    {
        public static readonly string _messageEn = "Block not found!";
        public static readonly string _messageTr = "Engelleme bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public UserUserBlockNotFouncException() : base((int)HttpStatusCode.NotFound) { }
    }
}

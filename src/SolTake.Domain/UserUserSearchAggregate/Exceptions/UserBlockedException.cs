using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.UserUserSearchAggregate.Exceptions
{
    public class UserBlockedException : AppException
    {
        private readonly static string _messageEn = "Cannot search this user because you are blocked. You must remove the block first.";
        private readonly static string _messageTr = "Kullanıcıyı engellediğin için arayamazsın. İlk önce engeli kaldırmalısın.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public UserBlockedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

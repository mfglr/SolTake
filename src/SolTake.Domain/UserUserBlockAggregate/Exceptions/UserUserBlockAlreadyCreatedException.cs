using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.UserUserBlockAggregate.Exceptions
{
    public class UserUserBlockAlreadyCreatedException : AppException
    {
        public static readonly string _messageEn = "You have already blocked this user!";
        public static readonly string _messageTr = "Bu kullanıcıyı daha önce zaten engelledin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public UserUserBlockAlreadyCreatedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

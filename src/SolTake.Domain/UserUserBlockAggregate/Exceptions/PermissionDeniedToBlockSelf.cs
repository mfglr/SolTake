using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.UserUserBlockAggregate.Exceptions
{
    public class PermissionDeniedToBlockSelf : AppException
    {
        public static readonly string _messageEn = "You have already blocked this user!";
        public static readonly string _messageTr = "Kullanıcı kensini engeleyemez!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public PermissionDeniedToBlockSelf() : base((int)HttpStatusCode.BadRequest) { }
    }
}

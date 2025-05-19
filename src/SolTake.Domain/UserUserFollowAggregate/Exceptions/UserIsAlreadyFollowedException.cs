using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.UserUserFollowAggregate.Exceptions
{
    public class UserIsAlreadyFollowedException : AppException
    {
        private readonly static string _messageEn = "You are already following this user!";
        private readonly static string _messageTr = "Bu kullanıcıyı zaten takip ediyorsun!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public UserIsAlreadyFollowedException() : base((int)HttpStatusCode.BadRequest)
        {
        }
    }
}

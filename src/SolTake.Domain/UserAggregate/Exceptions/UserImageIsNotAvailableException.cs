using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.UserAggregate.Exceptions
{
    public class UserImageIsNotAvailableException : AppException
    {
        private readonly static string _messageEn = "No profile image!";
        private readonly static string _messageTr = "Profile resmi yok!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public UserImageIsNotAvailableException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

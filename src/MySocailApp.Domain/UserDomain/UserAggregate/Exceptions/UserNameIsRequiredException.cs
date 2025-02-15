using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.UserDomain.UserAggregate.Exceptions
{
    public class UserNameIsRequiredException : AppException
    {
        private readonly static string _messageEn = "UserName is required!";
        private readonly static string _messageTr = "Kullanıcı adı gereklidir!";

        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public UserNameIsRequiredException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

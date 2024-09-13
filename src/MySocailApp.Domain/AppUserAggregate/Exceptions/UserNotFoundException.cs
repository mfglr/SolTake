using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class UserNotFoundException : AppException
    {
        private readonly static string _messageEn = "The user was not found!";
        private readonly static string _messageTr = "Kullanıcı bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public UserNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}

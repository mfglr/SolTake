using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.UserAggregate.Exceptions
{
    public class NameRequiredException : AppException
    {

        public static readonly string _messageEn = "Name field is required!";
        public static readonly string _messageTr = "İsim alanı gereklidir!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public NameRequiredException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

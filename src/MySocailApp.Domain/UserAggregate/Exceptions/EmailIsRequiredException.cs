using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.UserAggregate.Exceptions
{
    public class EmailIsRequiredException : AppException
    {
        private readonly static string _messageEn = "An email is required!";
        private readonly static string _messageTr = "Email gereklidir!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public EmailIsRequiredException() : base((int)HttpStatusCode.BadRequest) { }

    }
}

using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Application.Exceptions
{
    public class NotAuthorizedException : AppException
    {
        private readonly static string _messageEn = "You are not authorized!";
        private readonly static string _messageTr = "Yetkilendirilmedin!";
        private readonly static Dictionary<string, string> _messages = new ()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public NotAuthorizedException() : base((int)HttpStatusCode.Unauthorized) { }

    }
}

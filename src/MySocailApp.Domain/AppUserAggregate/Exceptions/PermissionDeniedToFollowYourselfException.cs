using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class PermissionDeniedToFollowYourselfException : AppException
    {
        private readonly static string _messageEn = "You can't follow yourself!";
        private readonly static string _messageTr = "Kendini takip edemezsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public PermissionDeniedToFollowYourselfException() : base((int)HttpStatusCode.BadRequest)
        {

        }
    }
}

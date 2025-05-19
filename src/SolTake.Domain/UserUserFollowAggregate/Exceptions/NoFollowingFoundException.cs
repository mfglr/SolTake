using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.UserUserFollowAggregate.Exceptions
{
    public class NoFollowingFoundException : AppException
    {
        private readonly static string _messageEn = "No following found";
        private readonly static string _messageTr = "Takip bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public NoFollowingFoundException() : base((int)HttpStatusCode.BadRequest)
        {
        }
    }
}

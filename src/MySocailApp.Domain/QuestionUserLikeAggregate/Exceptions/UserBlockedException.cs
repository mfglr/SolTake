using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionUserLikeAggregate.Exceptions
{
    public class UserBlockedException : AppException
    {
        private readonly static string _messageEn = "Cannot send a message to this user because you are blocked.";
        private readonly static string _messageTr = "Kullanıcıyı engellediğin için kullanıcıya mesaj gönderemezsin.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public UserBlockedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

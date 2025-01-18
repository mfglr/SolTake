using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.CommentAggregate.Exceptions
{
    public class CommentWasAlreadyLikedException : AppException
    {
        private readonly static string _messageEn = "You have already like the comment before!";
        private readonly static string _messageTr = "Bu yorumu zaten beğendin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public CommentWasAlreadyLikedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

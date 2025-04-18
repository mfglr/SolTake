using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.CommentUserLikeAggregate.Exceptions
{
    public class CommentAlreadyLikedException : AppException
    {
        private readonly static string _messageEn = "You have already liked the comment before!";
        private readonly static string _messageTr = "Bu yorumu zaten beğendin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public CommentAlreadyLikedException() : base((int)HttpStatusCode.Conflict) { }
    }
}

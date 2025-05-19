using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.CommentAggregate.Exceptions
{
    public class PermissionDeniedToDeleteCommentException : AppException
    {
        private readonly static string _messageEn = "You can't delete this comment! You are not the owner.";
        private readonly static string _messageTr = "Bu yorumu silemzsin! Sen bu yorum sahibi değilsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public PermissionDeniedToDeleteCommentException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

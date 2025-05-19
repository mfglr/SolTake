using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.CommentUserLikeAggregate.Exceptions
{
    public class CommentLikeNotFoundException : AppException
    {
        private readonly static string _messageEn = "You have not liked this comment!";
        private readonly static string _messageTr = "Bu yorumu zaten beğenmediniz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public CommentLikeNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}

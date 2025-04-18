using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.CommentUserLikeAggregate.Exceptions
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

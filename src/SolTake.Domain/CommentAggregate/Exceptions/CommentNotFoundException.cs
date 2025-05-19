using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.CommentAggregate.Exceptions
{
    public class CommentNotFoundException : AppException
    {
        private readonly static string _messageEn = "Comment coluld not found!";
        private readonly static string _messageTr = "Yorum bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public CommentNotFoundException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

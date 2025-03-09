using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.Exceptions
{
    public class ContentIsEmptyException : AppException
    {
        private readonly static string _messageEn = "Comment must not be empty";
        private readonly static string _messageTr = "Yorum boş olamaz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public ContentIsEmptyException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

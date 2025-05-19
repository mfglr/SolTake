using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.CommentAggregate.Exceptions
{
    public class ContentToLongException : AppException
    {
        private readonly static string _messageEn = "A comment cannot be longer than 2200 characters!";
        private readonly static string _messageTr = "Yorumun içeriği 2200 karakterden fazla olamaz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public ContentToLongException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

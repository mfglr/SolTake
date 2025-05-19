using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.CommentAggregate.Exceptions
{
    public class NoRootException : AppException
    {
        private readonly static string _messageEn = "A root could not found! The root of a comment can be a question, a solution or another comment!";
        private readonly static string _messageTr = "Kök bulunamadı. Bir yorumun kökü soru, çözüm ya da başka bir yorum olabilir.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public NoRootException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

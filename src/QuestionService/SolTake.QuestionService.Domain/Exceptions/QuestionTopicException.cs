using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.QuestionService.Domain.Exceptions
{
    public class QuestionTopicException : AppException
    {
        private readonly static string _messageEn = "The length of a topic can be between 3 and 5096 characters.";
        private readonly static string _messageTr = "Bir konunun uzunluğu 3 ile 5096 karakter arasında olabilir.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public QuestionTopicException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

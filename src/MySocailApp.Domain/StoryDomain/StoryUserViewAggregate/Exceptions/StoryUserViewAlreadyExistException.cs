using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.StoryDomain.StoryUserViewAggregate.Exceptions
{
    public class StoryUserViewAlreadyExistException : AppException
    {
        private readonly static string _messageEn = "This story has already been viewed!";
        private readonly static string _messageTr = "Bu hikaye daha önce görüntülendi!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public StoryUserViewAlreadyExistException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

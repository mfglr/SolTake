using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AIModelAggregate.Exceptions
{
    public class InvalidAIModelNameException : AppException
    {
        private readonly static string _messageEn = "Invalid ai model!";
        private readonly static string _messageTr = "Geçersiz yz model!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public InvalidAIModelNameException() : base((int)HttpStatusCode.BadRequest) { }

        public override string GetErrorMessage(string culture) => _messages[culture];
    }
}

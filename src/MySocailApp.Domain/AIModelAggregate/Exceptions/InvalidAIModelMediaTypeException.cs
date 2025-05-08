using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AIModelAggregate.Exceptions
{
    public class InvalidAIModelMediaTypeException : AppException
    {
        private readonly static string _messageEn = "The media of an ai model must be an image!";
        private readonly static string _messageTr = "Bir yz modelinin medyası resim olmalıdır!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public InvalidAIModelMediaTypeException() : base((int)HttpStatusCode.BadRequest) { }

        public override string GetErrorMessage(string culture) => _messages[culture];
    }
}

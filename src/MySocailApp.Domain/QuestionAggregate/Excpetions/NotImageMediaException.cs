using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class NotImageMediaException : AppException
    {
        private readonly static string _messageEn = "The uploaded media must be an image!";
        private readonly static string _messageTr = "Yüklenen media resim olmalıdır!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public NotImageMediaException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

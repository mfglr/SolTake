using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class QuestionImageIsRequiredException : AppException
    {
        private readonly static string _messageEn = "You must upload at least an image!";
        private readonly static string _messageTr = "En az bir resim yüklemelisin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public QuestionImageIsRequiredException() : base((int)HttpStatusCode.BadRequest)
        {
        }
    }
}

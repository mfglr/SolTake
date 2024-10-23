using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageAggregate.Exceptions
{
    public class MessageContentRequiredException : AppException
    {
        private readonly static string _messageEn = "A message can't be empty! A content or an image is required!";
        private readonly static string _messageTr = "Mesajin boş olamaz. İçerik ya da resim eklemelisin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public MessageContentRequiredException() : base((int)HttpStatusCode.BadRequest) { }

    }
}

using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions
{
    public class PermissionDeniedToAccessMessageImage : AppException
    {
        private readonly static string _messageEn = "You cannot view this message image. You are not the sender or receiver of this message.";
        private readonly static string _messageTr = "Bu mesajın sahibi ya da alıcısı olmadığın için resimleri görüntüleyemezsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public PermissionDeniedToAccessMessageImage() : base((int)HttpStatusCode.BadRequest) { }
    }
}

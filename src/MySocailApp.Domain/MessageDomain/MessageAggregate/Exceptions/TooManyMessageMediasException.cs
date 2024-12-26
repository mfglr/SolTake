using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions
{
    public class TooManyMessageMediasException : AppException
    {
        private readonly static string _messageEn = "You cannot upload more than 2 medias in a message.";
        private readonly static string _messageTr = "Bir mesaja 2' den fazla medya yükleyemezsiniz.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public TooManyMessageMediasException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

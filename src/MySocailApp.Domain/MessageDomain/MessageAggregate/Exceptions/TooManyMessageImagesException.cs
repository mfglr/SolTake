using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions
{
    public class TooManyMessageImagesException : AppException
    {
        private readonly static string _messageEn = "You cannot upload more than 2 images in a message.";
        private readonly static string _messageTr = "Bir mesaja 2' den fazla resim yükleyemezsiniz.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public TooManyMessageImagesException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

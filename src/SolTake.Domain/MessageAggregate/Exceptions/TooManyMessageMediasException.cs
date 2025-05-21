using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.MessageAggregate.Exceptions
{
    public class TooManyMessageMediasException : AppException
    {
        private readonly static string _messageEn = $"You cannot upload more than {Entities.Message.MaxNumberOfMessageImage} medias in a message.";
        private readonly static string _messageTr = $"Bir mesaja {Entities.Message.MaxNumberOfMessageImage}' den fazla medya yükleyemezsiniz.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public TooManyMessageMediasException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

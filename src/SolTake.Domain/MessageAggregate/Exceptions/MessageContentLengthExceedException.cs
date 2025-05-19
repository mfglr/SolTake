using MySocailApp.Domain.MessageDomain.MessageAggregate.ValueObjects;
using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageDomain.MessageAggregate.Exceptions
{
    public class MessageContentLengthExceedException : AppException
    {
        private readonly static string _messageEn = $"The length of a message content cannot exceed {MessageContent.MaxLength} characters!";
        private readonly static string _messageTr = $"Bir mesajın içeriğinin uzunluğu {MessageContent.MaxLength} karakterden daha uzun olamaz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public MessageContentLengthExceedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.MessageAggregate.Exceptions
{
    public class ReceiverNotFoundException : AppException
    {
        private readonly static string _messageEn = "The receiver could not be found!";
        private readonly static string _messageTr = "Alıcı bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public ReceiverNotFoundException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

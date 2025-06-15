using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.TopicRequestAggregate.Exceptions
{
    public class TopicRequestNotFoundException : AppException
    {
        private readonly static string _messageEn = "Request to create a topic not found!";
        private readonly static string _messageTr = "Konu oluşturma isteği bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public TopicRequestNotFoundException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

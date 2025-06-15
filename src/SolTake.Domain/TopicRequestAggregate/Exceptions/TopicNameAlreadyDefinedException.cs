using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.TopicRequestAggregate.Exceptions
{
    public class TopicNameAlreadyDefinedException : AppException
    {
        private readonly static string _messageEn = "The topic name has already been defined!";
        private readonly static string _messageTr = "Bu konu daha önce tanımlanmış!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public TopicNameAlreadyDefinedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

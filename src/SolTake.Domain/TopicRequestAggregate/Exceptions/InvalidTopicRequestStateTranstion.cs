using SolTake.Core;
using SolTake.Core.Exceptions;
using SolTake.Domain.TopicAggregate.Entities;
using System.Net;

namespace SolTake.Domain.TopicRequestAggregate.Exceptions
{
    public class InvalidTopicRequestStateTranstion : AppException
    {
        private readonly static string _messageEn = "The status of a request that is not pending cannot be changed.";
        private readonly static string _messageTr = "Beklemede olmayan bir isteğin durumu değiştirilemez.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidTopicRequestStateTranstion() : base((int)HttpStatusCode.BadRequest) { }
    }
}

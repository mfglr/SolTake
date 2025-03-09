using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionDomain.SolutionAggregate.Exceptions
{
    public class VoteIsNotFoundException : AppException
    {
        private readonly static string _messageEn = "Vote was not found!";
        private readonly static string _messageTr = "Oy bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public VoteIsNotFoundException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

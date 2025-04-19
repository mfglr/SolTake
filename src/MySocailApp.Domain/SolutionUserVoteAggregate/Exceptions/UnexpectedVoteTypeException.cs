using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionUserVoteAggregate.Exceptions
{
    public class UnexpectedVoteTypeException : AppException
    {
        private readonly static string _messageEn = "Unexpected vote type!";
        private readonly static string _messageTr = "Beklenmeyen oy tipi!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public UnexpectedVoteTypeException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

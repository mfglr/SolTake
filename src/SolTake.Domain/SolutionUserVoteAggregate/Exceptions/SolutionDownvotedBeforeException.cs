using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.SolutionUserVoteAggregate.Exceptions
{
    public class SolutionDownvotedBeforeException : AppException
    {
        private readonly static string _messageEn = "You have downvoted on the solution before!";
        private readonly static string _messageTr = "Bu çözüm için zaten olumsuz oy kullandın!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public SolutionDownvotedBeforeException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

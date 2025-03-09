using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionDomain.SolutionAggregate.Exceptions
{
    public class SolutionUpvotedBeforeException : AppException
    {
        private readonly static string _messageEn = "You have upvoted on the solution before!";
        private readonly static string _messageTr = "Bu çözüme daha önce olumlu oy verdin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public SolutionUpvotedBeforeException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

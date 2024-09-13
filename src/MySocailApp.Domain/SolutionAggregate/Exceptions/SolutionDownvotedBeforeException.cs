using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionDownvotedBeforeException : AppException
    {
        private readonly static string _messageTr = "You have downvoted on the solution before!";
        private readonly static string _messageEn = "Bu çözüm için zaten olumsuz oy kullandın!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public SolutionDownvotedBeforeException() : base((int)HttpStatusCode.BadRequest){}
    }
}

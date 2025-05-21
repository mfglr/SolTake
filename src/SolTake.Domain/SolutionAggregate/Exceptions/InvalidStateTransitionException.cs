using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.SolutionAggregate.Exceptions
{
    public class InvalidStateTransitionException : AppException
    {
        private readonly static string _messageEn = "Only solutions with a 'pending' state can be marked as 'correct' or 'incorrect'";
        private readonly static string _messageTr = "Sadece durumu 'beklemede' olan çözümlerin durumu 'doğru' ya da 'yanlış' olorak işaretlenebilir!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public InvalidStateTransitionException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

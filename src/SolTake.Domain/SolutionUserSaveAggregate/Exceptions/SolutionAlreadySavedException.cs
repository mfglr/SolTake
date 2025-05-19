using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionUserSaveAggregate.Exceptions
{
    public class SolutionAlreadySavedException : AppException
    {
        private readonly static string _messageEn = "This solution is already registered.";
        private readonly static string _messageTr = "Bu çözüm zaten kayıtlı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public SolutionAlreadySavedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

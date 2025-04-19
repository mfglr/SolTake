using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionUserSaveAggregate.Exceptions
{
    public class SolutionNotSavedException : AppException
    {
        private readonly static string _messageEn = "This solution is not registered!";
        private readonly static string _messageTr = "Bu çözüm zaten kayıtlı değil.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public SolutionNotSavedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

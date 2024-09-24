using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionAlreadySavedException : AppException
    {
        private readonly static string _messageEn = "Your have already saved the solution before!";
        private readonly static string _messageTr = "Bu çözümü daha önce kaydettin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public SolutionAlreadySavedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.SolutionAggregate.Exceptions
{
    internal class InvalidModelNameException : AppException
    {
        private readonly static string _messageEn = "Invalid AI model name!";
        private readonly static string _messageTr = "Geçersiz YZ model adı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public InvalidModelNameException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

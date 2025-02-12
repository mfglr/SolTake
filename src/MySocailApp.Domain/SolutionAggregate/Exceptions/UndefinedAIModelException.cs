using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.SolutionAggregate.Entities;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class UndefinedAIModelException : AppException
    {
        private readonly static string _messageEn = "This ai model is undefined.";
        private readonly static string _messageTr = "Bu ai modeli tanımsız.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public UndefinedAIModelException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

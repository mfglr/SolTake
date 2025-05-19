using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Core.AIModel
{
    public class UndefinedAIModelException : AppException
    {
        private readonly static string _messageEn = "This ai model is undefined.";
        private readonly static string _messageTr = "Bu yz modeli tanımsız.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public UndefinedAIModelException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

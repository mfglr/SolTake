using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Application.InfrastructureServices.IAService.Exceptions
{
    public class NotSolvableByAI : AppException
    {
        private readonly static string _messageEn = "In order for artificial intelligence to solve a question, that question must have only an image or text content.";
        private readonly static string _messageTr = "Yapay zekanın bir soruyu çözebilmesi için o sorunun yalnızca bir resim ya da metin içeriğine sahip olması gerekir.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public NotSolvableByAI() : base((int)HttpStatusCode.BadRequest) { }
    }
}

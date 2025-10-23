using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.QuestionService.Application.Exceptions
{
    internal class InvlidMediaType : AppException
    {
        private readonly static string _messageEn = "Invlid media type.";
        private readonly static string _messageTr = "Geçersiz media türü.";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvlidMediaType() : base((int)HttpStatusCode.BadRequest) { }
    }
}

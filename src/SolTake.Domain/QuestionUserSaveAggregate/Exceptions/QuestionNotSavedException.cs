using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserSaveAggregate.Exceptions
{
    public class QuestionNotSavedException : AppException
    {
        private readonly static string _messageEn = "The question is already not saved!";
        private readonly static string _messageTr = "Bu soru zaten kayıtlı değil!";

        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public QuestionNotSavedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

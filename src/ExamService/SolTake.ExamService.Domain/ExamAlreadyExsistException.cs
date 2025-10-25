using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.ExamService.Domain
{
    public class ExamAlreadyExsistException : AppException
    {
        private readonly static string _messageEn = "An exam with the same name already exists.";
        private readonly static string _messageTr = "Aynı isimde bir sınav zaten mevcut.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public ExamAlreadyExsistException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

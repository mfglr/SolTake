using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionContentLengthExceededException : AppException
    {
        private readonly static string _messageEn = $"The content length exceeds the allowed maximum limit of {SolutionContent.MaxSoluiontContentLength} characters.";
        private readonly static string _messageTr = $"Çözümün içeriği {SolutionContent.MaxSoluiontContentLength} karakterden daha fazla olamaz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public SolutionContentLengthExceededException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

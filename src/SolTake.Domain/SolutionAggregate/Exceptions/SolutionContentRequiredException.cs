using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.SolutionAggregate.Exceptions
{
    public class SolutionContentRequiredException : AppException
    {
        private readonly static string _messageEn = "You must upload content related to the solution!";
        private readonly static string _messageTr = "Çözümle ilgili içerik yüklemelisin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public SolutionContentRequiredException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

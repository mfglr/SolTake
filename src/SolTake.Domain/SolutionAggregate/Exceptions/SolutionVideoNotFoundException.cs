using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.SolutionAggregate.Exceptions
{
    public class SolutionVideoNotFoundException : AppException
    {
        private readonly static string _messageEn = "Solution video could not be found!";
        private readonly static string _messageTr = $"Çözümün videosu bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public SolutionVideoNotFoundException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

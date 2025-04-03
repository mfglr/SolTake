using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.StoryDomain.StoryAggregate.Exceptions
{
    public class StoryNotFoundException : AppException
    {
        private readonly static string _messageEn = "Story not found!";
        private readonly static string _messageTr = "Hikaye bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public StoryNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}

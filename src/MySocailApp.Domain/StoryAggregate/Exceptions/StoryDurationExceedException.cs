using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.StoryAggregate.Entities;
using System.Net;

namespace MySocailApp.Domain.StoryAggregate.Exceptions
{
    internal class StoryDurationExceedException : AppException
    {
        private readonly static string _messageEn = $"The story cannot exceed {Story.MaxDuration} seconds in length!";
        private readonly static string _messageTr = $"Hikaye süresi {Story.MaxDuration} saniyeden fazla olamaz.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public StoryDurationExceedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

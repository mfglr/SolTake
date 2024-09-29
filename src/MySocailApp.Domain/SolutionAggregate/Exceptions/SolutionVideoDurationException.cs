using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionVideoDurationException : AppException
    {
        private readonly static string _messageEn = $"The duration of the video must be less than {SolutionVideo.MaxDuration} seconds!";
        private readonly static string _messageTr = $"Videonun süresi {SolutionVideo.MaxDuration} saniyeden küçük olmalıdır!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public SolutionVideoDurationException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

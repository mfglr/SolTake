using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.Exceptions
{
    public class VideoDurationException : AppException
    {
        private readonly static int _videoDuration = 120;

        private readonly static string _messageEn = $"The duration of the video must be shorter than {_videoDuration} seconds!";
        private readonly static string _messageTr = $"Videonun süresi {_videoDuration} saniyeden küçük olmalıdır!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public VideoDurationException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

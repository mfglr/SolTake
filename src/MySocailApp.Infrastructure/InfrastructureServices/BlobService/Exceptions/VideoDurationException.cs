using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.Exceptions
{
    public class VideoDurationException : AppException
    {
        private readonly static string _messageEn = "The duration of the video cannot exceed 5 minutes.";
        private readonly static string _messageTr = "Videonun süresi 5 dakikayı geçemez.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public VideoDurationException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

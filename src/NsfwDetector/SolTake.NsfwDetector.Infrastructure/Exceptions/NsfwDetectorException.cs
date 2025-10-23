using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.NsfwDetector.Infrastructure.Exceptions
{
    internal class NsfwDetectorException(string message) : AppException((int)HttpStatusCode.InternalServerError,message: message)
    {
        private readonly static string _messageEn = "Nsfw Detector Exception";
        private readonly static string _messageTr = "Nsfw Detector Exception";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => $"{_messages[culture]} {Message}";
    }
}

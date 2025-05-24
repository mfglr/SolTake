using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Infrastructure.InfrastructureServices.BlobService.Exceptions
{
    public class InvalidMultimediaTypeException : AppException
    {
        private readonly static string _messageEn = "Invalid media type!";
        private readonly static string _messageTr = "Geçersiz medya!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public InvalidMultimediaTypeException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.Exceptions
{
    public class BlobNotFoundException : AppException
    {
        private readonly static string _messageEn = $"The media doesn't exist!";
        private readonly static string _messageTr = $"Media bulunamdı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public BlobNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}

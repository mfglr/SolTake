using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.BlobService.Infrastructure.Exceptions
{
    internal class BlobNotFoundException : AppException
    {
        private readonly static string _messageEn = "Blob not found in the container.";
        private readonly static string _messageTr = "Konteyner içinde blob bulunamadı.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public BlobNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}

using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.BlobService.Infrastructure.Exceptions
{
    internal class ContainerNotFoundException : AppException
    {
        private readonly static string _messageEn = "The specified container was not found.";
        private readonly static string _messageTr = "Konteyner bulunamadı.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public ContainerNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}

using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Infrastructure.InfrastructureServices.BlobService.Exceptions
{
    public class BlobNameExistException : AppException 
    {
        private readonly static string _messageEn = $"Blob name already exist!";
        private readonly static string _messageTr = $"Bu isimdeki blob zaten tanımlı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public BlobNameExistException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

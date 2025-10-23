using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.BlobService.Infrastructure.Exceptions
{
    internal class ContainerAlreadyExistException : AppException
    {
        private readonly static string _messageEn = "A container with the same name already exists.";
        private readonly static string _messageTr = "Aynı isme sahip bir konteyner zaten var.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public ContainerAlreadyExistException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

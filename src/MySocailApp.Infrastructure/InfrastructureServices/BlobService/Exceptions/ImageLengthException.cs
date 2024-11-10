using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.Exceptions
{
    public class ImageLengthException : AppException
    {
        private readonly static string _messageEn = $"The size of the image must be greater than 0.";
        private readonly static string _messageTr = $"Resmin boyutu 0 dan büyük olmalıdır.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public ImageLengthException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

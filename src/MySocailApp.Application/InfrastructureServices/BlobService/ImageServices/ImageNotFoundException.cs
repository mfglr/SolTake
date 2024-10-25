using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Application.InfrastructureServices.BlobService.ImageServices
{
    public class ImageNotFoundException : AppException
    {
        private readonly static string _messageEn = "Image could not found!";
        private readonly static string _messageTr = "Resim bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public ImageNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}

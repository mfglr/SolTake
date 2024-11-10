using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.Exceptions
{
    public class VideoLengthException : AppException
    {
        private readonly static string _messageEn = $"The size of a video cannot exceed {VideoService.MaxVideoLenghtMB} MB and cannot be empty!";
        private readonly static string _messageTr = $"Videonun boyutu {VideoService.MaxVideoLenghtMB} MB'ı geçemez ve boş olamaz!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public VideoLengthException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

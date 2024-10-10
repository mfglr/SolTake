using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Infrastructure.ApplicationServices.BlobService
{
    public class ExtentionNotFoundException : AppException
    {
        private readonly static string _messageEn = "The extension of the file could not be found!";
        private readonly static string _messageTr = "Dosyanın uzantısı bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public ExtentionNotFoundException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

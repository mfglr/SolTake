using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.UserDomain.UserAggregate.Exceptions
{
    public class CustomFileNotFoundException : AppException
    {
        private readonly static string _messageEn = "File is not found exception!";
        private readonly static string _messageTr = "Dosya bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public CustomFileNotFoundException() : base((int)HttpStatusCode.NotFound) { }
    }
}

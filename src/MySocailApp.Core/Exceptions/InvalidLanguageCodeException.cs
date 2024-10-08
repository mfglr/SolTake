using System.Net;

namespace MySocailApp.Core.Exceptions
{
    public class InvalidLanguageCodeException : AppException
    {
        private readonly static string _messageEn = "The language code is invalid!";
        private readonly static string _messageTr = "Geçersiz dil kodu!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidLanguageCodeException() : base((int)HttpStatusCode.Unauthorized) { }
    }
}

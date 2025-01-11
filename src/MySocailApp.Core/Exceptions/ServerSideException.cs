using System.Net;

namespace MySocailApp.Core.Exceptions
{
    public class ServerSideException : AppException
    {
        private readonly static string _messageEn = "Something went wrong! Please try again!";
        private readonly static string _messageTr = "Bir şeyler yanlış gitti! Lütfen tekrar deneyin!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => $"{_messages[culture]} {Message}";

        public ServerSideException(string? message = null) : base((int)HttpStatusCode.InternalServerError){}

    }
}

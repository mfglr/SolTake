using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.UserDomain.UserAggregate.Exceptions
{
    public class TooManyGeneratedTokenException : AppException
    {
        private readonly static string _messageEn = "You have exceeded the limit of generating tokens. Please wait an hour before trying again.";
        private readonly static string _messageTr = "Bir saat içerisinde en fazla 5 anahtar üretebilirsiniz. Lütfen bir saat sonra tekrar deneyiniz.";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public TooManyGeneratedTokenException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

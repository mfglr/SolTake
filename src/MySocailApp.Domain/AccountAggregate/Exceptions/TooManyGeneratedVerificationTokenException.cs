using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class TooManyGeneratedVerificationTokenException : AppException
    {
        private readonly static string _messageEn = "You have exceeded the limit of generating verification tokens. Please wait an hour before trying again.";
        private readonly static string _messageTr = "Bir saat içerisinde en fazla 10 email onaylama anahtarı üretebilirsiniz. Lütfen bir saat sonra tekrar deneyiniz.";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public TooManyGeneratedVerificationTokenException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

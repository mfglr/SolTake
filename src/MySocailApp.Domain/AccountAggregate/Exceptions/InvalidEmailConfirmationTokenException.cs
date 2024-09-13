using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class InvalidEmailConfirmationTokenException : AppException
    {
        private readonly static string _messageEn = "The token is invalid or expired! If you type the code incorrectly more than 3 times you must request the email to be resent!";
        private readonly static string _messageTr = "Bu kod geçersiz ya da süresi dolmuş. Eğer 3 kere den fazla yanlış deneme yaptıysan yeni bir kod istemelisin.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidEmailConfirmationTokenException() : base((int)HttpStatusCode.BadRequest){}
    }
}

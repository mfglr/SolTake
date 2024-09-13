using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class IncorrectPasswordException : AppException
    {
        private readonly static string _messageEn = "The password is incorrect";
        private readonly static string _messageTr = "Şifren yanlış!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public IncorrectPasswordException() : base((int)HttpStatusCode.BadRequest){}

        public override string GetErrorMessage(string culture) => _messages[culture];
    }
}

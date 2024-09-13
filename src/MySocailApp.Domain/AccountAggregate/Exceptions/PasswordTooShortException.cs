using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AccountAggregate.ValueObjects;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class PasswordTooShortException : AppException
    {
        private readonly static string _messageEn = $"Your password must be at least 6 characters long.";
        private readonly static string _messageTr = $"Şifreniz en az 6 karakter olmalıdır!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        
        public override string GetErrorMessage(string culture) => _messages[culture];

        public PasswordTooShortException() : base((int)HttpStatusCode.BadRequest){}

    }
}

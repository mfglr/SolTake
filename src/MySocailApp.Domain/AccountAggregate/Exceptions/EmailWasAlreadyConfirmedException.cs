using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class EmailWasAlreadyConfirmedException : AppException
    {
        private readonly static string _messageEn = "Your email has been already confirmed before!";
        private readonly static string _messageTr = "Zaten hesabın daha önce onaylanmış!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public EmailWasAlreadyConfirmedException() : base((int)HttpStatusCode.BadRequest) { }

        public override string GetErrorMessage(string culture) => _messages[culture];
    }
}
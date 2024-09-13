using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class EmailIsNotConfirmedException : AppException
    {
        private readonly static string _messageEn = "You must confirm your email first!";
        private readonly static string _messageTr = "İlk önce email hesabını onaylamalısın!";
        private readonly Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public EmailIsNotConfirmedException() : base((int)HttpStatusCode.BadRequest){}

        public override string GetErrorMessage(string culture) => _messages[culture];
    }
}

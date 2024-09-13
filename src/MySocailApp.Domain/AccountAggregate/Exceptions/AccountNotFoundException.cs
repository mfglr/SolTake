using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class AccountNotFoundException : AppException
    {
        private readonly static string _messageEn = "The account was not found!";
        private readonly static string _messageTr = "Hesap bulunamadı!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public AccountNotFoundException() : base((int)HttpStatusCode.NotFound){}

        public override string GetErrorMessage(string culture) => _messages[culture];
    }
}
using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace AccountDomain.AccountAggregate.Exceptions
{
    public class UserNameAlreadyExistException : AppException
    {

        private readonly static string _messageEn = "The username have already be taken!";
        private readonly static string _messageTr = "Kullanıcı adı zaten kullanılıyor!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public UserNameAlreadyExistException() : base((int)HttpStatusCode.BadRequest) { }

        public override string GetErrorMessage(string culture) => _messages[culture];
    }
}

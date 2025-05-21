using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.UserAggregate.Exceptions
{
    public class LoginFailedException : AppException
    {
        private readonly static string _messageEn = "Email or username or password is incorrect!";
        private readonly static string _messageTr = "Email hesabın ya da kullanıcı adın ya da ya da şifren hatalı!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public LoginFailedException() : base((int)HttpStatusCode.BadRequest)
        {
        }
    }
}

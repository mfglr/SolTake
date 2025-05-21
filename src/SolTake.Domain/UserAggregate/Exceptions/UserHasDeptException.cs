using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.UserAggregate.Exceptions
{
    public class UserHasDeptException : AppException
    {
        private readonly static string _messageEn = "You must your dept to delete your account!";
        private readonly static string _messageTr = "Hesabını silebilmek için borcunun ödemelisin!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public UserHasDeptException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

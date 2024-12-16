using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate.Exceptions
{
    public class PolicyNotApprovedException : AppException
    {
        private readonly static string _messageEn = "In order to use the application, you must accept the Privacy Policy and the Terms of Use ";
        private readonly static string _messageTr = "Uygulamayı kullanabilmeniz için Gizlilik Sözleşmesini ve Kullanıcı Sözleşmesini onaylamanız gerekmektedir.";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];

        public PolicyNotApprovedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

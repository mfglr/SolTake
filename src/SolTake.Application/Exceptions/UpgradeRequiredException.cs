using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Application.Exceptions
{
    public class UpgradeRequiredException : AppException
    {
        private readonly static string _messageEn = "You need to upgrade the application to continue using it!";
        private readonly static string _messageTr = "Uygulamayı kullanmaya devam edebilmek için son sürümü yüklemelisiniz!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public UpgradeRequiredException() : base((int)HttpStatusCode.UpgradeRequired) { }
    }
}

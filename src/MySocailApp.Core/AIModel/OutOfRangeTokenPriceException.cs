using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Core.AIModel
{
    public class OutOfRangeTokenPriceException : AppException
    {
        private readonly static string _messageEn = "The price of a token must not be less than 0!";
        private readonly static string _messageTr = "Bir tokenin fiyatı 0'dan küçük olamaz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public OutOfRangeTokenPriceException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

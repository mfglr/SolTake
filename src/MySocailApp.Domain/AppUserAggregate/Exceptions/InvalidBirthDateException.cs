using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class InvalidBirthDateException : AppException
    {
        public static readonly string _messageEn = "The date of birth must be earlier than the current date!";
        public static readonly string _messageTr = "Tarih güncel tarihten daha erken bir değer değil!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidBirthDateException() : base((int)HttpStatusCode.BadRequest)
        {
        }
    }
}

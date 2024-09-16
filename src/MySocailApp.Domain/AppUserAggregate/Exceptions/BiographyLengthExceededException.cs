using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.AppUserAggregate.ValueObjects;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class BiographyLengthExceededException : AppException
    {
        private readonly static string _messageEn = $"The biograpy length exceeds the allowed maximum limit of {Biography.MaxNumberOfCharacters} characters.";
        private readonly static string _messageTr = $"Biyografi {Biography.MaxNumberOfCharacters} karakterden daha fazla olamaz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public BiographyLengthExceededException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

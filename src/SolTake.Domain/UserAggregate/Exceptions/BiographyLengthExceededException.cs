using SolTake.Domain.UserAggregate.ValueObjects;
using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.UserAggregate.Exceptions
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

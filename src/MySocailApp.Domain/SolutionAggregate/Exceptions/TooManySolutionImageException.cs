using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class TooManySolutionImageException : AppException
    {
        private readonly static string _messageEn = "You can upload up to 3 image per solution";
        private readonly static string _messageTr = "Bir çözüm için en fazla 3 resim yükleyebilirsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public TooManySolutionImageException() : base((int)HttpStatusCode.BadRequest){}
    }
}

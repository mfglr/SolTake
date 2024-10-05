using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionVideoLengthException : AppException
    {
        private readonly static string _messageEn = "The size of the solution video cannot exceed 50 MB!";
        private readonly static string _messageTr = $"Çözüm videosunun boyutu 50 MB'ı geçemez!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public SolutionVideoLengthException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

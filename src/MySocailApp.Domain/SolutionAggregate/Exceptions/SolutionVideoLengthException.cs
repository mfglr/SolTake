using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class SolutionVideoLengthException : AppException
    {
        private readonly static string _messageEn = $"The size of the solution video cannot exceed {SolutionVideo.MaxLenghtMB} MB!";
        private readonly static string _messageTr = $"Çözüm videosunun boyutu {SolutionVideo.MaxLenghtMB} MB'ı geçemez!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public SolutionVideoLengthException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

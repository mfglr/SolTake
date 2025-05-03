using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class OutOfRangeTokenNumberException : AppException
    {
        private readonly static string _messageEn = "The number of tokens must not be less than 0!";
        private readonly static string _messageTr = "Token sayısı 0' dan küçük olamaz!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public OutOfRangeTokenNumberException() : base((int)HttpStatusCode.BadRequest) { }
    }
}

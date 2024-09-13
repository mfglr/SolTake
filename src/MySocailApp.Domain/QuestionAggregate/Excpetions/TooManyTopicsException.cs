using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class TooManyTopicsException : AppException
    {
        private readonly static string _messageEn = "You can add up to 3 topics per question!";
        private readonly static string _messageTr = "Bir soru için en fazla 3 resim yükleyebilirsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public TooManyTopicsException() : base((int)HttpStatusCode.BadRequest)
        {
        }
    }
}

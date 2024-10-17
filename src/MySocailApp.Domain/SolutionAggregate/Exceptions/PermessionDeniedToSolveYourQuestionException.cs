using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class PermessionDeniedToSolveYourQuestionException : AppException
    {
        private readonly static string _messageEn = "You can't solve your questions!";
        private readonly static string _messageTr = "Kendi sorunu çözemezsin!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public PermessionDeniedToSolveYourQuestionException() : base((int)HttpStatusCode.BadRequest){}
    }
}

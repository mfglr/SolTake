using MySocailApp.Core;
using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class PermissionDeniedToChangeStateOfSolution : AppException
    {
        private readonly static string _messageEn = "Only the owner of the question can change the status of this solution.";
        private readonly static string _messageTr = "Sadece sorunun sahibi çözümün durumu değiştirebilir!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public PermissionDeniedToChangeStateOfSolution() : base((int)HttpStatusCode.BadRequest) { }
    }
}

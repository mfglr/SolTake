using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.MessageUserRemoveAggregate.Exceptions
{
    public class PermissionDeniedToRemoveMessageFromEveryoneException : AppException
    {
        private readonly static string _messageEn = "Only the message owner can delete the message for everyone!";
        private readonly static string _messageTr = "Sadece mesajın sahibi, mesajı herkes için silebili!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public PermissionDeniedToRemoveMessageFromEveryoneException() : base((int)HttpStatusCode.BadRequest)
        {
        }
    }
}

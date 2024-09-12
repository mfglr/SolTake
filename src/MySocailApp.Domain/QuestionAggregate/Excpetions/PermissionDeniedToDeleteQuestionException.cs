using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class PermissionDeniedToDeleteQuestionException : ClientSideException
    {
        private readonly static string _message = "You can't delete this message! You are not the owner of this question!";
        public PermissionDeniedToDeleteQuestionException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

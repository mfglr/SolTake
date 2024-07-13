using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class EmptyQuestionImageException : ClientSideException
    {
        private readonly static string _message = "A question image can't be empty!";
        public EmptyQuestionImageException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}

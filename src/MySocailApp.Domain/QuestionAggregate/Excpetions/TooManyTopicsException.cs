using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.QuestionAggregate.Excpetions
{
    public class TooManyTopicsException : ClientSideException
    {
        private readonly static string _message = "You can add up to 3 topics per question";
        public TooManyTopicsException() : base(_message, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}

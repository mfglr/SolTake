using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.CommentAggregate.Exceptions
{
    public class QuestionIsNotFoundException : ClientSideException
    {
        private readonly static string _message = "The comment could not be created! The question you wanted to comment on was not found! It should have been deleted!";
        public QuestionIsNotFoundException() : base(_message, (int)HttpStatusCode.NotFound)
        {
        }
    }
}

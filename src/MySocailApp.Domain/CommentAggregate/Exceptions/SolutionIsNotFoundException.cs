using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.CommentAggregate.Exceptions
{
    public class SolutionIsNotFoundException : ClientSideException
    {
        private readonly static string _message = "The comment could not be created! The solution you wanted to comment on was not found. it should have been deleted!";
        public SolutionIsNotFoundException() : base(_message, (int)HttpStatusCode.NotFound){}
    }
}

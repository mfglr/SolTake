using MySocailApp.Core.Exceptions;

namespace MySocailApp.Domain.CommentAggregate.Exceptions
{
    public class NoRootException : ServerSideException
    {
        private readonly static string _message = "A root was not found! The root of a comment can be a question, a solution or another comment!";
        public NoRootException() : base(_message){}
    }
}

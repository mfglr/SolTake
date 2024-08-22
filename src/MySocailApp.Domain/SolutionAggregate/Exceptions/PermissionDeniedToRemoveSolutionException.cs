using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class PermissionDeniedToRemoveSolutionException : ClientSideException
    {
        private readonly static string _message = "You can't delete this soluion!";
        public PermissionDeniedToRemoveSolutionException() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class PermissionDeniedToChangeStateOfSolution : ClientSideException
    {
        private readonly static string _message = "Only the owner of the question can change the status of this solution. You do not have permission.";
        public PermissionDeniedToChangeStateOfSolution() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

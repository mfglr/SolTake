using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.SolutionAggregate.Exceptions
{
    public class UnathorizedApproval : ClientSideException
    {
        private readonly static string _message = "You can't approve the solutions that don't belong to your questions!";
        public UnathorizedApproval() : base(_message, (int)HttpStatusCode.BadRequest){}
    }
}

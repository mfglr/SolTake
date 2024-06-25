using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class UserIsAlreadyBlockedException : ClientSideException
    {
        private readonly static string _messsage = "You have already blocked the user before!";
        public UserIsAlreadyBlockedException() : base(_messsage, (int)HttpStatusCode.BadRequest)
        {
        }
    }
}

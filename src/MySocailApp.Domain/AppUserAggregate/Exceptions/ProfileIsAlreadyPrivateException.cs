using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    internal class ProfileIsAlreadyPrivateException : ClientSideException
    {
        public ProfileIsAlreadyPrivateException() : base("Your profile is already private!", (int)HttpStatusCode.BadRequest) { }
    }
}

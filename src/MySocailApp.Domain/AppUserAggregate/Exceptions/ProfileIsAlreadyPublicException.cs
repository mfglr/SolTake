using MySocailApp.Core.Exceptions;
using System.Net;

namespace MySocailApp.Domain.AppUserAggregate.Exceptions
{
    public class ProfileIsAlreadyPublicException : ClientSideException
    {
        public ProfileIsAlreadyPublicException() : base("Your profile is already public!", (int)HttpStatusCode.BadRequest) { }
    }
}

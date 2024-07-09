using MySocailApp.Core.Exceptions;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class InvalidRefreshTokenException : ClientSideException
    {
        public InvalidRefreshTokenException() : base("Your session is over or refresh token is invalid! You must log in again.", 419)
        {
        }
    }
}

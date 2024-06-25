using MySocailApp.Core.Exceptions;

namespace MySocailApp.Domain.AccountAggregate.Exceptions
{
    public class InvalidRefreshTokenException : ClientSideException
    {
        public InvalidRefreshTokenException() : base("Your session is over! You must log in again.", 419)//Session is over exception
        {
        }
    }
}

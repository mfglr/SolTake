using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices
{
    internal static class PasswordValidatorDomainService
    {
        public static void Validate(string password, string passwordConfirm)
        {
            if (password == null)
                throw new PasswordIsRequiredException();
            if (password.Length < 6)
                throw new PasswordTooShortException();
            if (password != passwordConfirm)
                throw new PassowordAndPasswordConfirmationNotMatchException();
        }
    }
}

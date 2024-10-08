using MySocailApp.Domain.AccountAggregate.Exceptions;

namespace MySocailApp.Domain.AccountAggregate.DomainServices.InternalDomainServices
{
    internal static class UserNameValidatorDomainService
    {
        private static readonly string _validCharacters = "0123456789abcdefghijklmnopqrstuvwxyz_.";

        private static bool IsValid(string value)
        {
            foreach (char c in value)
                if (!_validCharacters.Contains(c))
                    return false;
            return true;
        }

        public static void Validate(string userName)
        {
            if (string.IsNullOrEmpty(userName))
                throw new UserNameIsRequiredException();

            if (!IsValid(userName))
                throw new InvalidUserNameException();
        }
    }
}

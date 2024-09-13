namespace MySocailApp.Domain.AccountAggregate.ValueObjects
{
    public static class UserName
    {
        private static readonly string _validCharacters = "0123456789abcdefghijklmnopqrstuvwxyz_.";

        public static bool IsValid(string value)
        {
            foreach (char c in value)
                if (!_validCharacters.Contains(c))
                    return false;
            return true;
        }
    }
}

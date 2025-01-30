using AccountDomain.AccountAggregate.Exceptions;
using System.Text.RegularExpressions;

namespace AccountDomain.AccountAggregate.ValueObjects
{
    public class Email
    {
        private readonly static string _emailRegexPattern = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";
        private readonly static Regex _regex = new(_emailRegexPattern);

        public string Value { get; private set; }

        public Email(string value)
        {
            if (value == null || !_regex.Match(value).Success)
                throw new InvalidEmailException();
            Value = value;
        }

        public UserName GenerateUserName()
        {
            int i = 0;
            while (Value[i] != '@') i++;
            return new($"{Value[..i].ToLower()}_{BitConverter.ToInt64(Guid.NewGuid().ToByteArray(), 0).ToString()[..5]}");
        }


        public static Email SystemEmail(UserName userName) => new($"{userName.Value}@system.com");
    }
}

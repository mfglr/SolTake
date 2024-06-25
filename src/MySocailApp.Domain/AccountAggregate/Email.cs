using System.Text.RegularExpressions;

namespace MySocailApp.Domain.AccountAggregate
{
    public class Email
    {
        private readonly static string _emailRegexPattern = "^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$";

        public static bool IsValid(string value)
        {
            var regex = new Regex(_emailRegexPattern);
            return regex.Match(value).Success;
        }

        public static string GenerateUserName(string value)
        {
            int i = 0;
            while (value[i] != '@') i++;
            return $"{value[..i].ToLower()}_{BitConverter.ToInt64(Guid.NewGuid().ToByteArray(), 0)}";
        }
    }
}

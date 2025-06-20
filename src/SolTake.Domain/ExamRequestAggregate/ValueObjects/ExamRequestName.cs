using SolTake.Domain.ExamRequestAggregate.Exceptions;
using System.Text.RegularExpressions;

namespace SolTake.Domain.ExamRequestAggregate.ValueObjects
{
    public class ExamRequestName
    {
        public static readonly int MinLength = 3;
        public static readonly int MaxLength = 256;

        public string Value { get; private set; }

        public ExamRequestName(string value)
        {
            if (value == null || value.Length < MinLength || value.Length > MaxLength)
                throw new InvalidExamRequestNameException();
            Value = string.Join(' ',Clear(value).Split(' ').Select(ToUpperFirst));
        }

        private static string Clear(string value) => Regex.Replace(value.Trim(), @"\s+", " ");

        private static string ToUpperFirst(string value) =>
            $"{char.ToUpper(value[0])}{value[1..].ToLower()}";
    }
}

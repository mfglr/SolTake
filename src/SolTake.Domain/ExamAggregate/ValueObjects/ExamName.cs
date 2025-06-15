using SolTake.Domain.ExamAggregate.Exceptions;
using System.Text.RegularExpressions;

namespace SolTake.Domain.ExamAggregate.ValueObjects
{
    public class ExamName
    {
        public static readonly int MinLength = 3;
        public static readonly int MaxLength = 256;

        public string Value { get; private set; }

        public ExamName(string value)
        {
            if (value == null || value.Length < MinLength || value.Length > MaxLength)
                throw new InvalidExamNameException();
            Value = Clear(value).Split(' ').Aggregate((x, y) => $"{ToUpperFirst(x)} {ToUpperFirst(y)}");
        }

        private static string Clear(string value) => Regex.Replace(value.Trim(), @"\s+", " ");

        private static string ToUpperFirst(string value) => 
            $"{char.ToUpper(value[0])}{value[1..].ToLower()}";
    }
}

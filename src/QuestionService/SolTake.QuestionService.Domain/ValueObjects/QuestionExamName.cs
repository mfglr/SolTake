using SolTake.QuestionService.Domain.Exceptions;
using System.Text.RegularExpressions;

namespace SolTake.QuestionService.Domain.ValueObjects
{
    public class QuestionExamName
    {
        public static readonly int MinLength = 3;
        public static readonly int MaxLength = 512;

        public string Value { get; private set; }

        public QuestionExamName(string value)
        {
            if (value == null || value.Length < MinLength || value.Length > MaxLength)
                throw new InvalidExamNameException();
            Value = string.Join(' ', Clear(value).Split(' ').Select(ToUpperFirst));
        }

        private static string Clear(string value) => Regex.Replace(value.Trim(), @"\s+", " ");

        private static string ToUpperFirst(string value) =>
            $"{char.ToUpper(value[0])}{value[1..].ToLower()}";

        public static bool operator ==(QuestionExamName x, QuestionExamName y) => x.Value == y.Value;
        public static bool operator !=(QuestionExamName x, QuestionExamName y) => x.Value != y.Value;
    }
}

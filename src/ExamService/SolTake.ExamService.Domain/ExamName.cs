using System.Text.RegularExpressions;

namespace SolTake.ExamService.Domain
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
            Value = string.Join(' ',Clear(value).Split(' ').Select(ToUpperFirst));
        }

        private static string Clear(string value) => Regex.Replace(value.Trim(), @"\s+", " ");

        private static string ToUpperFirst(string value) => 
            $"{char.ToUpper(value[0])}{value[1..].ToLower()}";

        public static bool operator ==(ExamName x, ExamName y) => x.Value == y.Value;
        public static bool operator !=(ExamName x, ExamName y) => x.Value != y.Value;
    }
}

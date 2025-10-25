using SolTake.QuestionService.Domain.Exceptions;
using System.Text.RegularExpressions;

namespace SolTake.QuestionService.Domain.ValueObjects
{
    public class QuestionSubjectName
    {
        public static readonly int MinLength = 3;
        public static readonly int MaxLength = 128;

        public string Value { get; private set; }

        public QuestionSubjectName(string value)
        {
            if (string.IsNullOrEmpty(value) || value.Length < MinLength || value.Length > MaxLength)
                throw new InvalidQuestionSubjectNameException();
            Value = string.Join(' ', Clear(value).Split(' ').Select(ToUpperFirst));
        }

        private static string Clear(string value) => Regex.Replace(value.Trim(), @"\s+", " ");

        private static string ToUpperFirst(string value) =>
            $"{char.ToUpper(value[0])}{value[1..].ToLower()}";
    }
}

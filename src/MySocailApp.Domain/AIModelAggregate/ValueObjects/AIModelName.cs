using MySocailApp.Domain.AIModelAggregate.Exceptions;

namespace MySocailApp.Domain.AIModelAggregate.ValueObjects
{
    public class AIModelName
    {
        private static class AIModelNames
        {
            public readonly static string Gpt_4_1 = "gpt-4.1";
            public readonly static string Gpt_4_1_MINI = "gpt-4.1-mini";
            public readonly static string Gpt_4O = "gpt-4o";
            public readonly static string Gpt_4O_MINI = "gpt-4o-mini";
            public readonly static string Gpt_O4_MINI = "o4-mini";
            public readonly static string Gpt_O1 = "o1";

            private readonly static IEnumerable<string> _modelNames = 
                [
                    Gpt_4_1,
                    Gpt_4_1_MINI,
                    Gpt_4O,
                    Gpt_4O_MINI,
                    Gpt_O4_MINI,
                    Gpt_O1
                ];

            public static bool IsValidName(string name) => _modelNames.Contains(name);
        }

        public string Value { get; private set; }

        public AIModelName(string value)
        {
            if (!AIModelNames.IsValidName(value))
                throw new InvalidAIModelNameException();
            Value = value;
        }
    }
}

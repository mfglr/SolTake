using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionAggregate.ValueObjects
{
    public class SolutionAIModel
    {
        private class AIModelNames
        {
            private readonly static string _gpt_4_1 = "gpt-4.1";
            private readonly static string _gpt_4_1_MINI = "gpt-4.1-mini";
            private readonly static string _gpt_4O = "gpt-4o";
            private readonly static string _gpt_4O_MINI = "gpt-4o-mini";
            private readonly static string _gpt_O4_MINI = "o4-mini";
            private readonly static string _gpt_O1 = "o1";

            private readonly static string[] _names = [
                _gpt_4_1,
                _gpt_4_1_MINI,
                _gpt_4O,
                _gpt_4O_MINI,
                _gpt_O4_MINI,
                _gpt_O1
            ];

            public static bool ValidName(string name) => _names.Contains(name);
        }

        public string Name { get; private set; }

        public SolutionAIModel(string name)
        {
            if (!AIModelNames.ValidName(name))
                throw new UndefinedAIModelException();
            Name = name;
        }
    }
}

using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects
{
    public class SolutionAIModel
    {
        private class AIModelNames
        {
            private readonly static string GPT_4O = "gpt-4o";
            private readonly static string GPT_4O_MINI = "gpt-4o-mini";
            private readonly static string[] Names = [GPT_4O, GPT_4O_MINI];

            public static bool ValidName(string name) => Names.Contains(name);
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

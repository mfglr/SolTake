using MySocailApp.Domain.SolutionAggregate.Exceptions;

namespace MySocailApp.Domain.SolutionAggregate.ValueObjects
{
    public class SolutionAIModel
    {
        private class AIModelNames
        {
            public readonly static string Gpt_4_1 = "gpt-4.1";
            public readonly static string Gpt_4_1_MINI = "gpt-4.1-mini";
            public readonly static string Gpt_4O = "gpt-4o";
            public readonly static string Gpt_4O_MINI = "gpt-4o-mini";
            public readonly static string Gpt_O4_MINI = "o4-mini";
            public readonly static string Gpt_O1 = "o1";

            private readonly static string[] _names = [
                Gpt_4_1,
                Gpt_4_1_MINI,
                Gpt_4O,
                Gpt_4O_MINI,
                Gpt_O4_MINI,
                Gpt_O1
            ];

            public static bool ValidName(string name) => _names.Contains(name);
        }

        private readonly static Dictionary<string, decimal> _inputPrices = new()
        {
            { AIModelNames.Gpt_4_1, 0.000002m },
            { AIModelNames.Gpt_4_1_MINI, 0.0000004m },
            { AIModelNames.Gpt_4O, 0.0000025m },
            { AIModelNames.Gpt_4O_MINI, 0.00000015m },
            { AIModelNames.Gpt_O4_MINI, 0.0000011m },
            { AIModelNames.Gpt_O1, 0.000015m }
        };

        private readonly static Dictionary<string, decimal> _outputPrices = new()
        {
            { AIModelNames.Gpt_4_1, 0.000008m },
            { AIModelNames.Gpt_4_1_MINI, 0.0000016m },
            { AIModelNames.Gpt_4O, 0.00001m },
            { AIModelNames.Gpt_4O_MINI, 0.0000006m },
            { AIModelNames.Gpt_O4_MINI, 0.0000044m },
            { AIModelNames.Gpt_O1, 0.00006m }
        };

        public string Name { get; private set; }
        public SolutionToken Input { get; private set; }
        public SolutionToken Output { get; private set; }

        public SolutionAIModel(string name,int numberOfInputToken, int numberOfOutputToken)
        {
            if (!AIModelNames.ValidName(name))
                throw new UndefinedAIModelException();
            Name = name;
            Input = new (_inputPrices[name], numberOfInputToken);
            Output = new(_outputPrices[name], numberOfOutputToken); 

        }
    }
}

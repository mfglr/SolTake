namespace MySocailApp.Core.AIModel
{
    public class AIModel
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

        private readonly static Dictionary<string, int> _inputPrices = new()
        {
            { AIModelNames.Gpt_4_1, 200 },
            { AIModelNames.Gpt_4_1_MINI, 40 },
            { AIModelNames.Gpt_4O, 250 },
            { AIModelNames.Gpt_4O_MINI, 15 },
            { AIModelNames.Gpt_O4_MINI, 110 },
            { AIModelNames.Gpt_O1, 1500 }
        };

        private readonly static Dictionary<string, int> _outputPrices = new()
        {
            { AIModelNames.Gpt_4_1, 800 },
            { AIModelNames.Gpt_4_1_MINI, 160 },
            { AIModelNames.Gpt_4O, 1000 },
            { AIModelNames.Gpt_4O_MINI, 60 },
            { AIModelNames.Gpt_O4_MINI, 440 },
            { AIModelNames.Gpt_O1, 6000 }
        };

        public string Name { get; private set; }
        public AIToken Input { get; private set; }
        public AIToken Output { get; private set; }

        public Sol Cost => Input.Cost + Output.Cost;
        public Sol Price => Input.Price + Output.Price;


        private AIModel() { }

        public AIModel(string name, int numberOfInputToken, int numberOfOutputToken)
        {
            if (!AIModelNames.ValidName(name))
                throw new UndefinedAIModelException();
            Name = name;
            Input = new(_inputPrices[name], numberOfInputToken);
            Output = new(_outputPrices[name], numberOfOutputToken);

        }
    }
}

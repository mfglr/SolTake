using SolTake.SolutionService.Domain.Exceptions;

namespace SolTake.SolutionService.Domain.ValueObjects
{
    public class ModelName
    {
        private readonly static List<string> _modelNames =
            [
                "gpt-4o-mini",
                "gpt-4.1-mini"
            ];

        private static bool IsValidName(string name) => _modelNames.Any(x => x == name);

        public string Value { get; private set; }

        public ModelName(string value)
        {
            if (!IsValidName(value))
                throw new InvalidModelNameException();
            Value = value;
        }
    }
}

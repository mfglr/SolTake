namespace MySocailApp.Domain.CreditAggregate.ValueObjects
{
    public class Token
    {
        public string Name { get; private set; }
        public decimal Price { get; private set; }

        private Token(string name, decimal price)
        {
            Name = name;
            Price = price;
        }

        public static Token GPT4OInput() => new("gpt-4o input", 0.0000025M);
        public static Token GPT4OOutput() => new("gpt-4o output", 0.00001M);
        public static Token GPT4OMiniInput() => new("gpt-4o-mini input", 0.00000015M);
        public static Token GPT4OMiniOuput() => new("gpt-4o-mini output", 0.0000006M);
    }
}

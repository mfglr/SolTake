namespace MySocailApp.Core.AIModel
{
    public class AIToken
    {
        public decimal Price { get; private set; }
        public int Number { get; private set; }

        public decimal Cost => Price * Number;

        public AIToken(decimal price, int number)
        {
            if (price < 0)
                throw new OutOfRangeTokenPriceException();

            if (number < 0)
                throw new OutOfRangeTokenNumberException();

            Price = price;
            Number = number;
        }
    }
}

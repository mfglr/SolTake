namespace MySocailApp.Core.AIModel
{
    public class AIToken
    {
        public int SolPerToken { get; private set; }
        public int TokenNumber { get; private set; }

        public Sol Cost => new(SolPerToken * TokenNumber);

        public AIToken(int solPerToken, int tokenNumber)
        {
            if (solPerToken < 0)
                throw new OutOfRangeTokenPriceException();

            if (tokenNumber < 0)
                throw new OutOfRangeTokenNumberException();

            SolPerToken = solPerToken;
            TokenNumber = tokenNumber;
        }
    }
}

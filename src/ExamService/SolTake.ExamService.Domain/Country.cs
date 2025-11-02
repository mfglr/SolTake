namespace SolTake.ExamService.Domain
{
    public class Country
    {
        private static readonly IEnumerable<string> _countries = 
            [
                "Türkiye"
            ];


        public string Value { get; private set; }

        public Country(string value)
        {
            if (!_countries.Any(x => x == value))
                throw new Exception("Invalid country name.");

            Value = value;
        }
    }
}

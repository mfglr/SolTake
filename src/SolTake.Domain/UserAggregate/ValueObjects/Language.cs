using SolTake.Core;

namespace MySocailApp.Domain.UserAggregate.ValueObjects
{
    public class Language
    {
        public readonly static string[] _list = [Languages.TR, Languages.EN];

        public string Value { get; private set; }

        public Language(string? value)
        {
            if (value == null)
            {
                Value = new(Languages.DEFAULT);
                return;
            }
            string temp = new string(value.TakeWhile(x => x != '-').ToArray()).ToLower();
            foreach (var item in _list)
            {
                if (temp == item)
                {
                    Value = temp;
                    return;
                }
            }
            Value = new(Languages.DEFAULT);
        }
    }
}

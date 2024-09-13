namespace MySocailApp.Core
{
    public static class Languages
    {

        public static readonly string TR = "tr";
        public static readonly string EN = "en";

        private readonly static string[] _list = [TR, EN];

        public static bool IsAcceptedLanguage(string language)
        {
            foreach (var item in _list)
                if(language == item)
                    return true;
            return false;
        }

        public static string GetLanguage(string? culture)
        {
            if (culture == null) return EN;
            var language = new string(culture.TakeWhile(x => x != '-').ToArray());
            return IsAcceptedLanguage(language) ? language : EN;
        }
    }
}

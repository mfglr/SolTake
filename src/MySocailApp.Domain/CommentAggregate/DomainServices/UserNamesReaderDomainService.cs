namespace MySocailApp.Domain.CommentAggregate.DomainServices
{
    public static class UserNamesReaderDomainService
    {
        public static List<string> GetUserNames(string content)
        {
            List<string> userNames = [];

            for (int i = 0; i < content.Length; i++)
            {
                while (i < content.Length && content[i] == '@')
                {
                    i++;
                    string temp = "";
                    while (i < content.Length && content[i] != '@' && content[i] != ' ')
                    {
                        temp += content[i];
                        i++;
                    }
                    userNames.Add(temp);
                }
            }
            return userNames;
        }
    }
}

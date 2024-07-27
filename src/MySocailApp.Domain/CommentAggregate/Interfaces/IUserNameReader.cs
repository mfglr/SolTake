namespace MySocailApp.Domain.CommentAggregate.Interfaces
{
    public interface IUserNameReader
    {
        List<string> GetUserNames(string content);
    }
}

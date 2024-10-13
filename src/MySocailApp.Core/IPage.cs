namespace MySocailApp.Core
{
    public interface IPage
    {
        int Offset { get; }
        int Take { get; }
        bool IsDescending { get; }
    }
}

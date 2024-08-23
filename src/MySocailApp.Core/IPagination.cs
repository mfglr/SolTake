namespace MySocailApp.Core
{
    public interface IPagination
    {
        int? Offset { get; }
        int Take { get; }
        bool IsDescending { get; }
    }
}

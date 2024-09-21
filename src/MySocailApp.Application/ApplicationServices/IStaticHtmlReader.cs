namespace MySocailApp.Application.ApplicationServices
{
    public interface IStaticHtmlReader
    {
        Task<string> ReadAsync(string name);
    }
}

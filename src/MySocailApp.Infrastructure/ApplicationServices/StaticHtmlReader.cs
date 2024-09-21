using MySocailApp.Application.ApplicationServices;

namespace MySocailApp.Infrastructure.ApplicationServices
{
    public class StaticHtmlReader : IStaticHtmlReader
    {
        public async Task<string> ReadAsync(string name)
        {
            using var file = File.OpenRead(name);
            using var reader = new StreamReader(file);
            var r = await reader.ReadToEndAsync();
            file.Close();
            reader.Close();
            return r;
        }
    }
}

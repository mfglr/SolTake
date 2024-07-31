using MySocailApp.Application.ApplicationServices.BlobService;

namespace MySocailApp.Infrastructure.ApplicationServices.BlobService
{
    public class BlobNameGenerator : IBlobNameGenerator
    {
        public string Generate() => $"{Guid.NewGuid()}_{DateTime.UtcNow.Ticks}";
    }
}

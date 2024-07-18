using MySocailApp.Application.Services.BlobService;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class BlobNameGenerator : IBlobNameGenerator
    {
        public string Generate() => $"{Guid.NewGuid()}_{DateTime.UtcNow.Ticks}";
    }
}

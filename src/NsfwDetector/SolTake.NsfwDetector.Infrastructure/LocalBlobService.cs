using Microsoft.Extensions.Configuration;
using SolTake.NsfwDetector.Application;

namespace SolTake.NsfwDetector.Infrastructure
{
    internal class LocalBlobService(IConfiguration configuration) : IBlobService
    {
        private readonly IConfiguration _configuration = configuration;

        public async Task<Stream> ReadAsync(string containerName, string blobName, CancellationToken cancellationToken)
        {
            var baseAddress = new Uri(_configuration["BlobService"]!);
            var address = $"{baseAddress}/get/{containerName}/{blobName}";
            var client = new HttpClient();
            return await client.GetStreamAsync(address, cancellationToken);
        }
    }
}

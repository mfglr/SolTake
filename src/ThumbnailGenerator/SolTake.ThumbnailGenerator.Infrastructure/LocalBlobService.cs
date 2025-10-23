using Microsoft.Extensions.Configuration;
using SolTake.ThumbnailGenerator.Application;
using System.Text;
using System.Text.Json;

namespace SolTake.ThumbnailGenerator.Infrastructure
{
    internal class LocalBlobService(IConfiguration configuration) : IBlobService
    {
        private readonly IConfiguration _configuration = configuration;

        public async Task UploadAsync(Stream stream, string containerName, string blobName, CancellationToken cancellationToken)
        {
            var baseAddress = new Uri(_configuration["BlobService"]!);
            var address = $"{baseAddress}/uploadSingleBlob";
            var client = new HttpClient();
            
            var form = new MultipartFormDataContent
            {
                { new StringContent(containerName), "containerName" },
                { new StringContent(blobName), "blobName" },
                { new StreamContent(stream), "media", "media" }
            };

            var message = await client.PostAsync(address, form, cancellationToken);
            await message.Content.ReadAsStringAsync(cancellationToken);
        }

        public async Task DeleteAsync(string containerName, string blobName, CancellationToken cancellationToken)
        {
            var baseAddress = new Uri(_configuration["BlobService"]!);
            var address = $"{baseAddress}/delete";
            var client = new HttpClient();
            var json = JsonSerializer.Serialize( new { containerName, blobNames = new[] { blobName } } );
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            var message = await client.PostAsync(address, content, cancellationToken);
            await message.Content.ReadAsStringAsync(cancellationToken);
        }
            
        public async Task<Stream> GetAsync(string containerName, string blobName, CancellationToken cancellationToken)
        {
            var baseAddress = new Uri(_configuration["BlobService"]!);
            var address = $"{baseAddress}/get/{containerName}/{blobName}";
            var client = new HttpClient();
            return await client.GetStreamAsync(address, cancellationToken);
        }
    }
}

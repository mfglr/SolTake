using Microsoft.AspNetCore.Http;
using MySocailApp.Core;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService
{
    public class MultiMedyaService
    {

        public async Task<List<MultiMedya>> UploadAsync(string containerName, IFormFileCollection files, CancellationToken cancellationToken)
        {
            foreach (var file in files)
            {
                
            }
            return [];
        }

    }
}

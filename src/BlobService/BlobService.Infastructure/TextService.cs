using BlobService.Application;
using BlobService.Application.Objects;
using BlobService.Infastructure.InternalServices;
using Microsoft.AspNetCore.Http;

namespace BlobService.Infastructure
{
    public class TextService(ITransactionService transactionService) : ITextService
    {
        private readonly ITransactionService _transactionService = transactionService;

        public async Task<string> UploadAsync(IFormFile file, string containerName, CancellationToken cancellationToken)
        {
            var blobName = BlobNameGenerator.Generate(RootName.Policies, ContainerName.PrivacyPolicies, extention: "html");
            var path = PathFinder.GetPath(RootName.Policies, containerName, blobName);
            _transactionService.AddFileCreated(path);

            using var blob = File.Create(path);
            using var stream = file.OpenReadStream();
            await stream.CopyToAsync(blob, cancellationToken);
            blob.Close();
            return blobName;
        }

        public async Task<List<string>> UploadAsync(IFormFileCollection files, string containerName, CancellationToken cancellationToken)
        {
            var blobNames = new List<string>();
            foreach (var file in files)
                blobNames.Add(await UploadAsync(file, containerName, cancellationToken));
            return blobNames;
        }

        public Stream Read(string containerName, string blobName)
            => File.OpenRead(PathFinder.GetPath(RootName.Policies, containerName, blobName));
    }
}

using Microsoft.AspNetCore.Http;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Application.InfrastructureServices.BlobService.TextService;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.TextServices
{
    public class TextService(IPathsContainer pathsContainer, IPathFinder pathFinder, IBlobNameGenerator blobNameGenerator) : ITextService
    {
        private readonly IPathsContainer _pathsContainer = pathsContainer;
        private readonly IPathFinder _pathFinder = pathFinder;
        private readonly IBlobNameGenerator _blobNameGenerator = blobNameGenerator;

        public async Task<string> UploadAsync(IFormFile file, string containerName, CancellationToken cancellationToken)
        {
            var blobName = _blobNameGenerator.Generate(RootName.Policies, ContainerName.PrivacyPolicies, extention: "html");
            var path = _pathFinder.GetPath(RootName.Policies, containerName, blobName);
            _pathsContainer.Add(path);

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
            => File.OpenRead(_pathFinder.GetPath(RootName.Policies, containerName, blobName));
    }
}

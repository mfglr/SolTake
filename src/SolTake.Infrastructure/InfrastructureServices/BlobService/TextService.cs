﻿using Microsoft.AspNetCore.Http;
using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Infrastructure.InfrastructureServices.BlobService.InternalServices;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService
{
    public class TextService(UniqNameGenerator blobNameGenerator, IPathFinder pathFinder) : ITextService
    {
        private readonly UniqNameGenerator _blobNameGenerator = blobNameGenerator;
        private readonly IPathFinder _pathFinder = pathFinder;

        public async Task<string> UploadAsync(IFormFile file, string containerName, CancellationToken cancellationToken)
        {
            var blobName = _blobNameGenerator.Generate("html");
            var path = _pathFinder.GetPath(containerName, blobName);

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
    }
}

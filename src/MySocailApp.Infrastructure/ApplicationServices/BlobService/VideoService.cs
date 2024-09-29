using Microsoft.AspNetCore.Http;
using MySocailApp.Application.ApplicationServices.BlobService;

namespace MySocailApp.Infrastructure.ApplicationServices.BlobService
{
    public class VideoService(IBlobNameGenerator generator) : IVideoService
    {
        private static readonly string _rootPath = "Videos";
        private readonly IBlobNameGenerator _generator = generator;
        private readonly List<string> _blobs = [];

        private static string GetPath(string containerName, string blobName) => $"{_rootPath}/{containerName}/{blobName}.mp4";
        
        public async Task<AppVideo> SaveAsync(IFormFile file,CancellationToken cancellationToken)
        {
            var blobName = _generator.Generate();
            var path = GetPath(ContainerName.SolutionVideos, blobName);
            
            using var stream = file.OpenReadStream();
            using var savedFile = File.Create(path);
            await stream.CopyToAsync(savedFile,cancellationToken);
            savedFile.Close();
            _blobs.Add(path);

            using var tfile = TagLib.File.Create(path);
            TimeSpan duration = tfile.Properties.Duration;

            return new(blobName, duration.TotalSeconds);
        }

        public void RollBack()
        {
            foreach (var blob in _blobs)
            {
                if (File.Exists(blob))
                    File.Delete(blob);
            }
        }
    }
}

using Microsoft.AspNetCore.Http;
using MySocailApp.Application.Services.BlobService;

namespace MySocailApp.Infrastructure.Services.BlobService
{
    public class BlobService(IBlobNameGenerator generator, IDimentionCalculator dimentionCalculator) : IBlobService
    {
        private readonly IBlobNameGenerator _generator = generator;
        private readonly IDimentionCalculator _dimentionCalculator = dimentionCalculator;
        private static readonly string _rootPath = "Images";
        private readonly List<Image> _images = [];

        private static string GetPath(string containerName, string blobName) => $"{_rootPath}/{containerName}/{blobName}";

        public async Task<Image> UploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken)
        {
            string blobName = _generator.Generate();
            var stream = file.OpenReadStream();
            Dimention dimention = _dimentionCalculator.Calculate(stream);

            var path = GetPath(containerName, blobName);
            using var fileStream = File.Create(path);
            await stream.CopyToAsync(fileStream, cancellationToken);
          
            var image = new Image(containerName,blobName, dimention);
            _images.Add(image);
            return image;
        }
        
        public Stream Read(string containerName, string blobName) => File.OpenRead(GetPath(containerName, blobName));

        public async Task<List<Image>> UploadAsync(string containerName, IFormFileCollection files, CancellationToken cancellationToken)
        {
            List<Image> images = [];
            foreach (var file in files)
                images.Add(await UploadAsync(containerName, file, cancellationToken));
            return images;
        }

        public void Rollback()
        {
            foreach (var image in _images)
            {
                var path = GetPath(image.ContainerName, image.BlobName);
                if (File.Exists(path))
                    File.Delete(path);
            }
        }
    }
}

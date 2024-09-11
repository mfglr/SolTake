using Microsoft.AspNetCore.Http;
using MySocailApp.Application.ApplicationServices.BlobService;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Formats.Jpeg;
using System.IO;

namespace MySocailApp.Infrastructure.ApplicationServices.BlobService
{
    public class BlobService(IBlobNameGenerator generator, IDimentionCalculator dimentionCalculator) : IBlobService
    {
        private readonly IBlobNameGenerator _generator = generator;
        private readonly IDimentionCalculator _dimentionCalculator = dimentionCalculator;
        private static readonly string _rootPath = "Images";
        private readonly List<Application.ApplicationServices.BlobService.Image> _images = [];

        private static string GetPath(string containerName, string blobName) => $"{_rootPath}/{containerName}/{blobName}";

        public async Task<Application.ApplicationServices.BlobService.Image> UploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken)
        {
            string blobName = _generator.Generate();
            using var stream = file.OpenReadStream();
            Dimention dimention = _dimentionCalculator.Calculate(stream);
            stream.Position = 0;

            var path = GetPath(containerName, blobName);
            var options = new JpegEncoder { Quality = 25 };
            using var t = await SixLabors.ImageSharp.Image.LoadAsync(stream, cancellationToken);
            await t.SaveAsync(path, options, cancellationToken);

            var image = new Application.ApplicationServices.BlobService.Image(containerName, blobName, dimention);
            _images.Add(image);
            return image;
        }

        public Stream Read(string containerName, string blobName)
            => File.OpenRead(GetPath(containerName, blobName));

        public async Task<List<Application.ApplicationServices.BlobService.Image>> UploadAsync(string containerName, IFormFileCollection files, CancellationToken cancellationToken)
        {
            List<Application.ApplicationServices.BlobService.Image> images = [];
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

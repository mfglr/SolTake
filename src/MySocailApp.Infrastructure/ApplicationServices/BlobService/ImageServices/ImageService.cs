using Microsoft.AspNetCore.Http;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.ApplicationServices.BlobService.ImageServices;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Application.Extentions;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Formats.Jpeg;

namespace MySocailApp.Infrastructure.ApplicationServices.BlobService.ImageServices
{
    public class ImageService(IBlobNameGenerator generator, IDimentionCalculator dimentionCalculator, IPathsContainer pathContainer, IPathFinder pathFinder) : IImageService
    {
        private readonly IBlobNameGenerator _generator = generator;
        private readonly IDimentionCalculator _dimentionCalculator = dimentionCalculator;
        private readonly IPathsContainer _pathContainer = pathContainer;
        private readonly IPathFinder _pathFinder = pathFinder;

        public async Task<AppImage> UploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken)
        {
            string blobName = _generator.Generate(RootName.Image, containerName);
            using var stream = file.OpenReadStream();
            Dimention dimention = _dimentionCalculator.Calculate(stream);
            stream.Position = 0;

            var path = _pathFinder.GetPath(RootName.Image, containerName, blobName);
            JpegEncoder options;
            if (stream.Length > 1048576)
                options = new JpegEncoder { Quality = 25 };
            else
                options = new JpegEncoder { Quality = 100 };

            using var t = await Image.LoadAsync(stream, cancellationToken);
            await t.SaveAsync(path, options, cancellationToken);
            _pathContainer.Add(path);

            return new AppImage(containerName, blobName, dimention);
        }

        public async Task<List<AppImage>> UploadAsync(string containerName, IFormFileCollection files, CancellationToken cancellationToken)
        {
            List<AppImage> images = [];
            foreach (var file in files)
                images.Add(await UploadAsync(containerName, file, cancellationToken));
            return images;
        }

        public async Task<byte[]> ReadAsync(string containerName, string blobName)
        {
            using var stream = File.OpenRead(_pathFinder.GetPath(RootName.Image, containerName, blobName));
            var bytes = await stream.ToByteArrayAsync();
            stream.Close();
            stream.Dispose();
            return bytes;
        }

        public void Delete(string containerName, string blobName)
        {
            var path = _pathFinder.GetPath(RootName.Image, containerName, blobName);
            if (File.Exists(path))
                File.Delete(path);
        }

        public void DeleteRange(string containerName, IEnumerable<string> blobNames)
        {
            foreach (var blobName in blobNames)
            {
                var path = _pathFinder.GetPath(RootName.Image, containerName, blobName);
                if (File.Exists(path))
                    File.Delete(path);
            }
        }
    }
}

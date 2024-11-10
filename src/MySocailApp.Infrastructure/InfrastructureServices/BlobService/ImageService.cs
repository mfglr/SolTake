using Microsoft.AspNetCore.Http;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.Exceptions;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Formats.Jpeg;
using SixLabors.ImageSharp.Formats.Webp;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService
{
    public class ImageService(IBlobService blobService, UniqNameGenerator blobNameGenerator,ImageTransformer imageTransformer, DimentionCalculator dimentionCalculator, TempDirectoryService tempDirectoryService) : IImageService
    {
        private readonly IBlobService _blobService = blobService;
        private readonly UniqNameGenerator _blobNameGenerator = blobNameGenerator;
        private readonly ImageTransformer _imageTransformer = imageTransformer;
        private readonly DimentionCalculator _dimentionCalculator = dimentionCalculator;
        private readonly TempDirectoryService _tempDirectoryService = tempDirectoryService;

        private async Task<AppImage> InternalUploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken)
        {
            //get stream
            using var stream = file.OpenReadStream();

            //load image
            using var image = await Image.LoadAsync(stream, cancellationToken);

            //transform image
            _imageTransformer.Transform(image);

            //calculate dimention
            Dimention dimention = _dimentionCalculator.Calculate(image);

            //save image to temp directory
            string blobName = _blobNameGenerator.Generate();
            var path = _tempDirectoryService.GetBlobPath(blobName);
            await image.SaveAsWebpAsync(path, new() { Quality = 25 }, cancellationToken);

            //save image to the blob container
            using var imageStream = File.OpenRead(path);
            await _blobService.UploadAsync(imageStream, containerName, blobName, cancellationToken);

            return new AppImage(containerName, blobName, dimention);
        }

        public async Task<AppImage> UploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken)
        {
            if (file.Length == 0)
                throw new ImageLengthException();

            _tempDirectoryService.Create();
            try
            {
                var image = await InternalUploadAsync(containerName, file, cancellationToken);
                _tempDirectoryService.Delete();
                return image;
            }
            catch (Exception)
            {
                _tempDirectoryService.Delete();
                throw;
            }
        }

        public async Task<List<AppImage>> UploadAsync(string containerName, IFormFileCollection files, CancellationToken cancellationToken)
        {
            if (files.Any(x => x.Length == 0))
                throw new ImageLengthException();

            List<AppImage> images = [];
            _tempDirectoryService.Create();
            try
            {
                foreach (var file in files)
                    images.Add(await InternalUploadAsync(containerName, file, cancellationToken));
                _tempDirectoryService.Delete();
                return images;
            }
            catch (Exception)
            {
                _tempDirectoryService.Delete();
                throw;
            }
        }
    }
}

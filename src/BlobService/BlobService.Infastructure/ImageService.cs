using BlobService.Application;
using BlobService.Application.Objects;
using BlobService.Infastructure.InternalServices;
using Microsoft.AspNetCore.Http;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Formats.Jpeg;

namespace BlobService.Infastructure
{
    public class ImageService(ITransactionService transactionService) : IImageService
    {
        private readonly ITransactionService _transactionService = transactionService;

        public async Task<AppImage> UploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken)
        {
            //generate blobName
            string blobName = BlobNameGenerator.Generate(RootName.Image, containerName);
            var path = PathFinder.GetPath(RootName.Image, containerName, blobName);
            _transactionService.Create(path);

            //load image
            using var stream = file.OpenReadStream();
            using var image = await Image.LoadAsync(stream, cancellationToken);

            //transform image
            ImageTransformer.Transform(image);
            //calculate dimention
            Dimention dimention = DimentionCalculator.Calculate(image);

            //save image
            JpegEncoder options;
            if (stream.Length > 1048576)
                options = new JpegEncoder { Quality = 25 };
            else
                options = new JpegEncoder { Quality = 100 };
            await image.SaveAsync(path, options, cancellationToken);

            return new AppImage(containerName, blobName, dimention);
        }

        public async Task<List<AppImage>> UploadAsync(string containerName, IFormFileCollection files, CancellationToken cancellationToken)
        {
            List<AppImage> images = [];
            foreach (var file in files)
                images.Add(await UploadAsync(containerName, file, cancellationToken));
            return images;
        }

        public async Task<byte[]> ReadAsync(string containerName, string blobName, CancellationToken cancellationToken)
        {
            using var stream = File.OpenRead(PathFinder.GetPath(RootName.Image, containerName, blobName));
            var bytes = await stream.ToByteArrayAsync(cancellationToken);
            stream.Close();
            stream.Dispose();
            return bytes;
        }

        public void Delete(string containerName, string blobName)
        {
            var path = PathFinder.GetPath(RootName.Image, containerName, blobName);
            if (File.Exists(path))
                File.Delete(path);
        }

        public void DeleteRange(string containerName, IEnumerable<string> blobNames)
        {
            foreach (var blobName in blobNames)
            {
                var path = PathFinder.GetPath(RootName.Image, containerName, blobName);
                if (File.Exists(path))
                    File.Delete(path);
            }
        }

        public async Task<AppImage> UpdateUserImageAsync(Guid userId, IFormFile file, CancellationToken cancellationToken)
        {
            //generate path
            string blobName = userId.ToString();
            var path = PathFinder.GetPath(RootName.Image, ContainerName.UserImages, blobName);
            _transactionService.Create(path);

            if (File.Exists(path))
                File.Move(path,);

            using var stream = file.OpenReadStream();

            //load image
            using var image = await Image.LoadAsync(stream, cancellationToken);
            
            //transform image
            ImageTransformer.Transform(image);
            
            //save image
            JpegEncoder options;
            if (stream.Length > 1048576)
                options = new JpegEncoder { Quality = 25 };
            else
                options = new JpegEncoder { Quality = 100 };
            await image.SaveAsync(path, options, cancellationToken);

            //calculate dimention
            Dimention dimention = DimentionCalculator.Calculate(image);

            return new AppImage(ContainerName.UserImages, blobName, dimention);
        }
    }
}

using Microsoft.AspNetCore.Http;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices;
using SixLabors.ImageSharp;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService
{
    public class MultiMediaService(TempDirectoryService tempDirectoryService, DimentionCalculator dimentionCalculator, UniqNameGenerator uniqNameGenerator, IBlobService blobService, VideoDimentionCalculator videoDimentionCalculator, VideoFastStartConverter videoFastStartConvertor, VideoDurationCalculator videoDurationCalculator) : IMultimedyaService
    {
        private readonly TempDirectoryService _tempDirectoryService = tempDirectoryService;
        private readonly DimentionCalculator _dimentionCalculator = dimentionCalculator;
        private readonly VideoDimentionCalculator _videoDimentionCalculator = videoDimentionCalculator;
        private readonly VideoFastStartConverter _videoFastStartConvertor = videoFastStartConvertor;
        private readonly VideoDurationCalculator _videoDurationCalculator = videoDurationCalculator;
        private readonly UniqNameGenerator _uniqNameGenerator = uniqNameGenerator;
        private readonly IBlobService _blobService = blobService;

        private async Task<Multimedia> UploadImageAsync(string containerName, IFormFile file, CancellationToken cancellationToken)
        {
            //calculate dimention
            Dimention dimention = await _dimentionCalculator.CalculateAsync(file, cancellationToken);

            //generate uniq blob name;
            var blobName = _uniqNameGenerator.Generate();
            var path = _tempDirectoryService.GetBlobPath(blobName);

            //save image to temp directory
            using var stream = file.OpenReadStream();
            var image = await Image.LoadAsync(stream, cancellationToken);
            await image.SaveAsWebpAsync(path, new() { Quality = 25 }, cancellationToken);

            //save image to the blob container
            using var imageStream = File.OpenRead(path);
            await _blobService.UploadAsync(imageStream, containerName, blobName, cancellationToken);
            
            //reuturn multimedya
            var medya = Multimedia.CreateImage(blobName, imageStream.Length, dimention.Height, dimention.Width);
            imageStream.Close();
            return medya;
        }
        private async Task<Multimedia> UploadVideoAsync(string containerName, IFormFile file, CancellationToken cancellationToken)
        {
            using var stream = file.OpenReadStream();

            //add stream to temp directory
            var input = await _tempDirectoryService.AddFile(stream);

            //calculate video dimention
            var dimention = _videoDimentionCalculator.Calculate(input);

            //calculate duration of the video
            var duration = _videoDurationCalculator.Calculate(input);

            //convert video to fast start;
            var output = await _videoFastStartConvertor.Convert(input, cancellationToken);

            //upload fastStartVideo to blob container
            var blobName = _uniqNameGenerator.Generate();
            using var fastStartVideo = File.OpenRead(output);
            await _blobService.UploadAsync(fastStartVideo, containerName, blobName, cancellationToken);

            //reuturn multimedya
            var multiMedya = Multimedia.CreateVideo(blobName, fastStartVideo.Length, dimention.Height, dimention.Width, duration);
            fastStartVideo.Close();
            return multiMedya;
        }

        public async Task<List<Multimedia>> UploadAsync(string containerName, IFormFileCollection files, CancellationToken cancellationToken)
        {
            List<Multimedia> medias = [];

            _tempDirectoryService.Create();
            try
            {
                foreach (var file in files)
                {
                    if (file.ContentType.StartsWith("image"))
                        medias.Add(await UploadImageAsync(containerName, file, cancellationToken));
                    if (file.ContentType.StartsWith("video"))
                        medias.Add(await UploadVideoAsync(containerName, file, cancellationToken));
                }
                _tempDirectoryService.Delete();
                return medias;
            }
            catch (Exception)
            {
                _tempDirectoryService.Delete();
                throw;
            }
        }

    }
}

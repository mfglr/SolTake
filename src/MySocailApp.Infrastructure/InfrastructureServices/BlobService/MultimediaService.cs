using Microsoft.AspNetCore.Http;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.Exceptions;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices;
using SixLabors.ImageSharp;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService
{
    public class MultiMediaService(ITempDirectoryService tempDirectoryService, DimentionCalculator dimentionCalculator, UniqNameGenerator uniqNameGenerator, IBlobService blobService, VideoDimentionCalculator videoDimentionCalculator, VideoManipulator videoManipulator, VideoDurationCalculator videoDurationCalculator, AudioDurationCalculator audioDurationCalculator, AudioManipulator audioManipulator, IFrameCatcher frameCathcer, IPathFinder pathFinder) : IMultimediaService
    {

        private readonly DimentionCalculator _dimentionCalculator = dimentionCalculator;

        private readonly VideoDimentionCalculator _videoDimentionCalculator = videoDimentionCalculator;
        private readonly VideoManipulator _videoManipulator = videoManipulator;
        private readonly VideoDurationCalculator _videoDurationCalculator = videoDurationCalculator;
        private readonly IFrameCatcher _frameCatcher = frameCathcer;

        private readonly AudioDurationCalculator _audioDurationCalculator = audioDurationCalculator;
        private readonly AudioManipulator _audioManipulator = audioManipulator;

        private readonly IPathFinder _pathFinder = pathFinder;
        private readonly ITempDirectoryService _tempDirectoryService = tempDirectoryService;
        private readonly UniqNameGenerator _uniqNameGenerator = uniqNameGenerator;
        private readonly IBlobService _blobService = blobService;

        private async Task<Multimedia> UploadImageAsync(string containerName, IFormFile file, CancellationToken cancellationToken, string? blobName = null)
        {
            //calculate dimention
            Dimention dimention = await _dimentionCalculator.CalculateAsync(file, cancellationToken);

            //get temp directory path;
            string path;
            blobName ??= _uniqNameGenerator.Generate();//generate uniq blob name;
            path = _pathFinder.GetPath(ContainerName.Temp, blobName);

            //save image to temp directory
            using var stream = file.OpenReadStream();
            var image = await Image.LoadAsync(stream, cancellationToken);
            await image.SaveAsWebpAsync(path, new() { Quality = 25 }, cancellationToken);

            //save image to the blob container
            using var imageStream = File.OpenRead(path);
            await _blobService.UploadAsync(imageStream, containerName, blobName, cancellationToken);

            //reuturn multimedya
            var media = Multimedia.CreateImage(containerName, blobName, imageStream.Length, dimention.Height, dimention.Width);
            imageStream.Close();
            return media;
        }

        private async Task<Multimedia> UploadVideoAsync(string containerName, IFormFile file, CancellationToken cancellationToken, string? blobName = null)
        {
            using var stream = file.OpenReadStream();

            //add stream to temp directory
            var input = await _tempDirectoryService.AddFile(stream);
            var inputPath = _pathFinder.GetPath(ContainerName.Temp, input);

            //manipulate video;
            var output = await _videoManipulator.Manipulate(inputPath, cancellationToken);
            var outputPath = _pathFinder.GetPath(ContainerName.Temp, output);

            //calculate video dimention
            var dimention = _videoDimentionCalculator.Calculate(outputPath);

            //calculate duration of the video
            var duration = _videoDurationCalculator.Calculate(outputPath);

            //save the first frame of the video
            var blobNameOfFrame = _frameCatcher.CatchFrame(ContainerName.Temp, output, 0);
            using var frameStream = File.OpenRead(_pathFinder.GetPath(ContainerName.Temp, blobNameOfFrame));
            await _blobService.UploadAsync(frameStream, containerName, blobNameOfFrame, cancellationToken);
            frameStream.Close();

            //upload the video manipulated to the blob container
            blobName ??= _uniqNameGenerator.Generate();//generate uniq blob name;
            using var manipulatedVideo = File.OpenRead(outputPath);
            await _blobService.UploadAsync(manipulatedVideo, containerName, blobName, cancellationToken);

            //reuturn multimedia
            var multiMedia = Multimedia.CreateVideo(containerName, blobName, blobNameOfFrame, manipulatedVideo.Length, dimention.Height, dimention.Width, duration);
            manipulatedVideo.Close();
            return multiMedia;
        }

        //private async Task<Multimedia> UploadAudioAsync(string containerName, IFormFile file, CancellationToken cancellationToken,string? blobName = null)
        //{
        //    using var stream = file.OpenReadStream();

        //    //add stream to temp directory
        //    var input = await _tempDirectoryService.AddFile(stream);

        //    //calculate audio duration
        //    var duration = _audioDurationCalculator.Calculate(input);

        //    //manipulate audio;
        //    var output = await _audioManipulator.Manipulate(input, cancellationToken);

        //    //upload the video manipulated to the blob container
        //    blobName ??= _uniqNameGenerator.Generate();//generate uniq blob name;
        //    using var manipulatedAudio = File.OpenRead(output);
        //    await _blobService.UploadAsync(manipulatedAudio, containerName, blobName, cancellationToken);

        //    //reuturn multimedia
        //    var multiMedya = Multimedia.CreateAudio(containerName, blobName, manipulatedAudio.Length, duration);
        //    manipulatedAudio.Close();
        //    return multiMedya;
        //}

        public Task<Multimedia> UploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken, string? blobName = null) =>
            _tempDirectoryService.CreateTransactionAsync(
                async () =>
                {
                    Multimedia? media = null;
                    if (file.ContentType.StartsWith("image"))
                        media = await UploadImageAsync(containerName, file, cancellationToken, blobName);
                    else if (file.ContentType.StartsWith("video"))
                        media = await UploadVideoAsync(containerName, file, cancellationToken, blobName);
                    else
                        throw new InvalidMultimediaTypeException();
                    return media;
                }
            );

        public Task<List<Multimedia>> UploadAsync(string containerName, IFormFileCollection files, CancellationToken cancellationToken) =>
            _tempDirectoryService.CreateTransactionAsync(
                async () =>
                {
                    List<Multimedia> medias = [];
                    foreach (var file in files)
                    {
                        if (file.ContentType.StartsWith("image"))
                            medias.Add(await UploadImageAsync(containerName, file, cancellationToken));
                        else if (file.ContentType.StartsWith("video"))
                            medias.Add(await UploadVideoAsync(containerName, file, cancellationToken));
                        else
                            throw new InvalidMultimediaTypeException();
                    }
                    return medias;
                }
            );
    }
}

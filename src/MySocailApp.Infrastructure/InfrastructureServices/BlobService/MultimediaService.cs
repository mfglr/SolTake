using Microsoft.AspNetCore.Http;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.Exceptions;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices;
using SixLabors.ImageSharp;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService
{
    public class MultiMediaService(TempDirectoryService tempDirectoryService, DimentionCalculator dimentionCalculator, UniqNameGenerator uniqNameGenerator, IBlobService blobService, VideoDimentionCalculator videoDimentionCalculator, VideoManipulator videoManipulator, VideoDurationCalculator videoDurationCalculator, FrameCatcher frameCatcher, AudioDurationCalculator audioDurationCalculator, AudioManipulator audioManipulator) : IMultimediaService
    {

        private readonly DimentionCalculator _dimentionCalculator = dimentionCalculator;

        private readonly VideoDimentionCalculator _videoDimentionCalculator = videoDimentionCalculator;
        private readonly VideoManipulator _videoManipulator = videoManipulator;
        private readonly VideoDurationCalculator _videoDurationCalculator = videoDurationCalculator;
        private readonly FrameCatcher _frameCatcher = frameCatcher;

        private readonly AudioDurationCalculator _audioDurationCalculator = audioDurationCalculator;
        private readonly AudioManipulator _audioManipulator = audioManipulator;

        private readonly TempDirectoryService _tempDirectoryService = tempDirectoryService;
        private readonly UniqNameGenerator _uniqNameGenerator = uniqNameGenerator;
        private readonly IBlobService _blobService = blobService;

        private async Task<Multimedia> UploadImageAsync(string containerName, IFormFile file, CancellationToken cancellationToken, string? blobName = null)
        {
            //calculate dimention
            Dimention dimention = await _dimentionCalculator.CalculateAsync(file, cancellationToken);

            //get temp directory path;
            string path;
            blobName ??= _uniqNameGenerator.Generate();//generate uniq blob name;
            path = _tempDirectoryService.GetBlobPath(blobName);

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

            //manipulate video;
            var output = await _videoManipulator.Manipulate(input, cancellationToken);

            //calculate video dimention
            var dimention = _videoDimentionCalculator.Calculate(output);

            //calculate duration of the video
            var duration = _videoDurationCalculator.Calculate(output);

            //save the first frame of the video
            var blobNameOfFrame = await _frameCatcher.SaveFrameAsync(output, containerName, cancellationToken);

            //upload the video manipulated to the blob container
            blobName ??= _uniqNameGenerator.Generate();//generate uniq blob name;
            using var manipulatedVideo = File.OpenRead(output);
            await _blobService.UploadAsync(manipulatedVideo, containerName, blobName, cancellationToken);

            //reuturn multimedya
            var multiMedya = Multimedia.CreateVideo(containerName, blobName, blobNameOfFrame, manipulatedVideo.Length, dimention.Height, dimention.Width, duration);
            manipulatedVideo.Close();
            return multiMedya;
        }
        private async Task<Multimedia> UploadAudioAsync(string containerName, IFormFile file, CancellationToken cancellationToken,string? blobName = null)
        {
            using var stream = file.OpenReadStream();

            //add stream to temp directory
            var input = await _tempDirectoryService.AddFile(stream);

            //calculate audio duration
            var duration = _audioDurationCalculator.Calculate(input);

            //manipulate audio;
            var output = await _audioManipulator.Manipulate(input, cancellationToken);

            //upload the video manipulated to the blob container
            blobName ??= _uniqNameGenerator.Generate();//generate uniq blob name;
            using var manipulatedAudio = File.OpenRead(output);
            await _blobService.UploadAsync(manipulatedAudio, containerName, blobName, cancellationToken);

            //reuturn multimedia
            var multiMedya = Multimedia.CreateAudio(containerName, blobName, manipulatedAudio.Length, duration);
            manipulatedAudio.Close();
            return multiMedya;
        }

        public async Task<Multimedia> UploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken,string? blobName = null)
        {
            _tempDirectoryService.Create();
            try
            {
                Multimedia? media = null;

                if (file.ContentType.StartsWith("image"))
                    media = await UploadImageAsync(containerName, file, cancellationToken, blobName);
                else if (file.ContentType.StartsWith("video"))
                    media = await UploadVideoAsync(containerName, file, cancellationToken, blobName);
                else if (file.ContentType.StartsWith("audio"))
                    media = await UploadAudioAsync(containerName, file, cancellationToken, blobName);
                else
                    throw new InvalidMultimediaTypeException();

                _tempDirectoryService.Delete();
                return media;
            }
            catch (Exception)
            {
                _tempDirectoryService.Delete();
                throw;
            }
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
                    else if (file.ContentType.StartsWith("video"))
                        medias.Add(await UploadVideoAsync(containerName, file, cancellationToken));
                    else if (file.ContentType.StartsWith("audio"))
                        medias.Add(await UploadAudioAsync(containerName, file, cancellationToken));
                    else
                        throw new InvalidMultimediaTypeException();
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

        public async Task<Multimedia> UpdateAsync(string containerName, string blobName, IFormFile file, CancellationToken cancellationToken)
        {
            await _blobService.MoveAsync(blobName, containerName, ContainerName.Trash, cancellationToken);
            
            _tempDirectoryService.Create();
            try
            {
                Multimedia? media = null;

                if (file.ContentType.StartsWith("image"))
                    media = await UploadImageAsync(containerName, file, cancellationToken, blobName);
                else if (file.ContentType.StartsWith("video"))
                    media = await UploadVideoAsync(containerName, file, cancellationToken, blobName);
                else if (file.ContentType.StartsWith("audio"))
                    media = await UploadAudioAsync(containerName, file, cancellationToken, blobName);
                else
                    throw new InvalidMultimediaTypeException();

                _tempDirectoryService.Delete();
                return media;
            }
            catch (Exception)
            {
                _tempDirectoryService.Delete();
                await _blobService.MoveAsync(blobName, ContainerName.Trash, containerName, cancellationToken);
                throw;
            }

        }
    }
}

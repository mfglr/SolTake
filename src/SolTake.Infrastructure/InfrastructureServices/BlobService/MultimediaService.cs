using Microsoft.AspNetCore.Http;
using OpenCvSharp;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Metadata.Profiles.Exif;
using SixLabors.ImageSharp.Processing;
using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Application.InfrastructureServices.BlobService.Objects;
using SolTake.Core;
using SolTake.Core.Exceptions;
using SolTake.Infrastructure.InfrastructureServices.BlobService.Exceptions;
using SolTake.Infrastructure.InfrastructureServices.BlobService.InternalServices;
using Xabe.FFmpeg;

namespace SolTake.Infrastructure.InfrastructureServices.BlobService
{
    public class MultiMediaService : IMultimediaService
    {
        private readonly IBlobService _blobService;
        private readonly UniqNameGenerator _uniqNameGenerator;
        private readonly IPathFinder _pathFinder;
        private readonly string _scopeContainerName;

        public MultiMediaService(UniqNameGenerator uniqNameGenerator, IPathFinder pathFinder, IBlobService blobService)
        {
            _uniqNameGenerator = uniqNameGenerator;
            _pathFinder = pathFinder;
            _blobService = blobService;
            _scopeContainerName = $"{ContainerName.Temp}/{_uniqNameGenerator.Generate()}";
        }

        private void Create() => Directory.CreateDirectory(_pathFinder.GetContainerPath(_scopeContainerName));
        private void Delete()
        {
            var path = _pathFinder.GetContainerPath(_scopeContainerName);
            if (Directory.Exists(path))
                Directory.Delete(path, true);
        }

        private async Task<Application.InfrastructureServices.BlobService.Objects.Dimention> CalculatedimentionAsync(IFormFile file, CancellationToken cancellationToken)
        {
            using var stream = file.OpenReadStream();
            using var image = await Image.LoadAsync(stream, cancellationToken);

            var profile = image.Metadata.ExifProfile;
            if (profile == null || !profile.TryGetValue(ExifTag.Orientation, out var orientation))
                return new (image.Height, image.Width);

            switch (orientation.Value)
            {
                case 2:
                    image.Mutate(x => x.Flip(SixLabors.ImageSharp.Processing.FlipMode.Horizontal));
                    break;
                case 3:
                    image.Mutate(x => x.Rotate(RotateMode.Rotate180));
                    break;
                case 4:
                    image.Mutate(x => x.Flip(SixLabors.ImageSharp.Processing.FlipMode.Vertical));
                    break;
                case 5:
                    image.Mutate(x => x.Rotate(RotateMode.Rotate90).Flip(SixLabors.ImageSharp.Processing.FlipMode.Horizontal));
                    break;
                case 6:
                    image.Mutate(x => x.Rotate(RotateMode.Rotate90));
                    break;
                case 7:
                    image.Mutate(x => x.Rotate(RotateMode.Rotate270).Flip(SixLabors.ImageSharp.Processing.FlipMode.Horizontal));
                    break;
                case 8:
                    image.Mutate(x => x.Rotate(RotateMode.Rotate270));
                    break;
            }
            return new(image.Height, image.Width);
        }

        private async Task<Multimedia> UploadImageAsync(string containerName, IFormFile file, CancellationToken cancellationToken, string? blobName = null)
        {
            var dimention = await CalculatedimentionAsync(file,cancellationToken);

            //manipulate and save tempdirectory;
            var stream0 = file.OpenReadStream();
            var image0 = await Image.LoadAsync(stream0, cancellationToken);
            string path;
            blobName ??= _uniqNameGenerator.Generate();//generate uniq blob name;
            path = _pathFinder.GetPath(_scopeContainerName, blobName);
            await image0.SaveAsWebpAsync(path, new() { Quality = 25 }, cancellationToken);

            //save image to the blob container
            using var imageStream = File.OpenRead(path);
            await _blobService.UploadAsync(imageStream, containerName, blobName, cancellationToken);

            //reuturn multimedya
            return Multimedia.CreateImage(containerName, blobName, imageStream.Length, dimention.Height, dimention.Width);
        }

        private async Task<Multimedia> UploadVideoAsync(string containerName, IFormFile file, CancellationToken cancellationToken, string? blobName = null)
        {
            using var stream = file.OpenReadStream();

            //add stream to temp directory
            var inputBlobName = _uniqNameGenerator.Generate();
            var inputPath = _pathFinder.GetPath(_scopeContainerName, inputBlobName);
            using var fileStream = File.Create(inputPath);
            await stream.CopyToAsync(fileStream);
            fileStream.Close();

            //manipulate video;
            var manipulatedVideoBlobName = _uniqNameGenerator.Generate("mp4");
            var manipulatedVideoPath = _pathFinder.GetPath(_scopeContainerName, manipulatedVideoBlobName);
            FFmpeg.SetExecutablesPath("FFmpeg");
            var conversion =
                FFmpeg.Conversions
                    .New()
                    .AddParameter($"-i \"{inputPath}\" -vf scale=480:-2 -c:v libx265 -crf 28 -movflags +faststart -c:a libopus -r 30 -preset medium \"{manipulatedVideoPath}\"");
            await conversion.Start(cancellationToken);

            //create video capture object
            using var videoCapture = new VideoCapture(manipulatedVideoPath);
            if (!videoCapture.IsOpened())
                throw new ServerSideException();

            //calculate video dimention
            Core.Dimention dimention = new(videoCapture.Get(VideoCaptureProperties.FrameHeight), videoCapture.Get(VideoCaptureProperties.FrameWidth));

            //calculate video duration
            var duration = videoCapture.Get(VideoCaptureProperties.FrameCount) / videoCapture.Get(VideoCaptureProperties.Fps);

            //save the first frame of the video
            using var frame = new Mat();
            videoCapture.Set(VideoCaptureProperties.PosMsec, 0);
            if (!videoCapture.Read(frame))
                throw new ServerSideException();

            //save first frame to temp directory;
            var frameBlobName = _uniqNameGenerator.Generate("webp");
            var framePath = _pathFinder.GetPath(_scopeContainerName, frameBlobName);
            frame.SaveImage(framePath, new ImageEncodingParam(ImwriteFlags.WebPQuality, 100));

            //upload first frame to blob
            var newFrameBlobName = _uniqNameGenerator.Generate();
            using var frameStream = File.OpenRead(framePath);
            await _blobService.UploadAsync(frameStream, containerName, newFrameBlobName, cancellationToken);

            //upload the video manipulated to the blob container
            blobName ??= _uniqNameGenerator.Generate();//generate uniq blob name;
            using var manipulatedVideo = File.OpenRead(manipulatedVideoPath);
            await _blobService.UploadAsync(manipulatedVideo, containerName, blobName, cancellationToken);

            //reuturn multimedia
            return Multimedia.CreateVideo(containerName, blobName, newFrameBlobName, manipulatedVideo.Length, dimention.Height, dimention.Width, duration);
        }

        public async Task<Multimedia> UploadAsync(string containerName, IFormFile file, CancellationToken cancellationToken, string? blobName = null)
        {

            Multimedia? media = null;
            try
            {
                Create();
                
                if (file.ContentType.StartsWith("image"))
                    media = await UploadImageAsync(containerName, file, cancellationToken, blobName);
                else if (file.ContentType.StartsWith("video"))
                    media = await UploadVideoAsync(containerName, file, cancellationToken, blobName);
                else
                    throw new InvalidMultimediaTypeException();

                Delete();

                return media;
            }
            catch (Exception)
            {
                Delete();
                if (media != null)
                    await _blobService.DeleteAsync(media.ContainerName, media.BlobName, cancellationToken);
                throw;
            }

        }

        public async Task<List<Multimedia>> UploadAsync(string containerName, IEnumerable<IFormFile> files, CancellationToken cancellationToken)
        {
            List<Multimedia> medias = [];
            try
            {
                Create();
                foreach (var file in files)
                {
                    if (file.ContentType.StartsWith("image"))
                        medias.Add(await UploadImageAsync(containerName, file, cancellationToken));
                    else if (file.ContentType.StartsWith("video"))
                        medias.Add(await UploadVideoAsync(containerName, file, cancellationToken));
                    else
                        throw new InvalidMultimediaTypeException();
                }
                Delete();
                return medias;
            }
            catch (Exception) {
                Delete();
                foreach (var media in medias)
                    await _blobService.DeleteAsync(media.ContainerName,media.BlobName, cancellationToken);
                throw;
            }

           
        }
    }
}

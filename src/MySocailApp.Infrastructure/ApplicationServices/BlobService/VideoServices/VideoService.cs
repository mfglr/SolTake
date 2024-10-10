using Microsoft.AspNetCore.Http;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;
using MySocailApp.Application.ApplicationServices.BlobService.VideoServices;

namespace MySocailApp.Infrastructure.ApplicationServices.BlobService.VideoServices
{
    public class VideoService(IBlobNameGenerator generator, IPathFinder pathFinder, IFrameCatcher frameCatcher, IPathsContainer pathContainer, IVideoDurationCalculator videoDurationCalculator, IVideoFastStartConverter videoFastStartConverter) : IVideoService
    {

        private readonly IBlobNameGenerator _generator = generator;
        private readonly IFrameCatcher _frameCatcher = frameCatcher;
        private readonly IVideoDurationCalculator _videoDurationCalculator = videoDurationCalculator;
        private readonly IPathsContainer _pathContainer = pathContainer;
        private readonly IPathFinder _pathFinder = pathFinder;
        private readonly IVideoFastStartConverter _videoFastStartConverter = videoFastStartConverter;

        public async Task<AppVideo> SaveAsync(IFormFile file, string containerNameOfVideo, string containerNameOfFrame, CancellationToken cancellationToken)
        {
            var blobNameOfVideo = _generator.Generate(RootName.Video, containerNameOfVideo,"mp4");
            var videoPath = _pathFinder.GetPath(RootName.Video, containerNameOfVideo, blobNameOfVideo);

            using var stream = file.OpenReadStream();
            using var savedFile = File.Create(videoPath);
            await stream.CopyToAsync(savedFile, cancellationToken);
            savedFile.Close();

            var convertedBlobNameOfVideo = await _videoFastStartConverter.Convert(containerNameOfVideo, blobNameOfVideo, cancellationToken);
            File.Delete(videoPath);

            var convertedVideoPath = _pathFinder.GetPath(RootName.Video, containerNameOfVideo, convertedBlobNameOfVideo);
            _pathContainer.Add(convertedVideoPath);

            var frame = await _frameCatcher.GetFrameAsync(convertedVideoPath, containerNameOfFrame, 0, cancellationToken);
            _pathContainer.Add(_pathFinder.GetPath(RootName.Image, containerNameOfFrame, frame.BlobName));

            var duration = await _videoDurationCalculator.CalculateAsync(convertedVideoPath, cancellationToken);
            return new(convertedBlobNameOfVideo, duration, frame, stream.Length);
        }

        public void Delete(string containerName, string blobName)
        {
            var path = _pathFinder.GetPath(RootName.Video, containerName, blobName);
            if (File.Exists(path))
                File.Delete(path);
        }

        public async Task<byte[]> Read(string containerName, string blobName, int offset, int count, CancellationToken cancellationToken)
        {
            using var stream = File.OpenRead(_pathFinder.GetPath(RootName.Video, containerName, blobName));
            var length = stream.Length;
            if (offset > length) return [];
            if (offset + count > length)
                count = (int)(length - offset);
            var data = new byte[count];
            stream.Position = offset;
            await stream.ReadAsync(data.AsMemory(0, count), cancellationToken);
            return data;
        }

        public Stream Read(string containerName, string blobName)
            => File.OpenRead(_pathFinder.GetPath(RootName.Video, containerName, blobName));
    }
}

using Microsoft.AspNetCore.Http;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.ApplicationServices.BlobService.Objects;

namespace MySocailApp.Infrastructure.ApplicationServices.BlobService
{
    public class VideoService(IBlobNameGenerator generator, IPathFinder pathFinder, IFrameCatcher frameCatcher, IPathsContainer pathContainer, IVideoDurationCalculator videoDurationCalculator) : IVideoService
    {

        private readonly IBlobNameGenerator _generator = generator;
        private readonly IFrameCatcher _frameCatcher = frameCatcher;
        private readonly IVideoDurationCalculator _videoDurationCalculator = videoDurationCalculator;
        private readonly IPathsContainer _pathContainer = pathContainer;
        private readonly IPathFinder _pathFinder = pathFinder;

        public async Task<AppVideo> SaveAsync(IFormFile file, string containerNameOfVideo, string containerNameOfFrame, CancellationToken cancellationToken)
        {
            var blobNameOfVideo = _generator.Generate(RootName.Video, containerNameOfVideo);
            var videoPath = _pathFinder.GetPath(RootName.Video, containerNameOfVideo, blobNameOfVideo);

            using var stream = file.OpenReadStream();
            using var savedFile = File.Create(videoPath);
            await stream.CopyToAsync(savedFile, cancellationToken);
            savedFile.Close();
            _pathContainer.Add(videoPath);

            var frame = await _frameCatcher.GetFrameAsync(videoPath, containerNameOfFrame, 0, cancellationToken);
            _pathContainer.Add(_pathFinder.GetPath(RootName.Image,containerNameOfFrame,frame.BlobName));

            var duration = await _videoDurationCalculator.CalculateAsync(videoPath, cancellationToken);

            return new(blobNameOfVideo, duration, frame);
        }

        public void Delete(string containerName,string blobName)
        {
            var path = _pathFinder.GetPath(RootName.Video,containerName, blobName);
            if(File.Exists(path))
                File.Delete(path);
        }

        public Stream Read(string containerName, string blobName)
            => File.OpenRead(_pathFinder.GetPath(RootName.Video, containerName, blobName));
    }
}

using Microsoft.AspNetCore.Http;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core.Exceptions;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.Exceptions;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices;
using OpenCvSharp;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService
{
    public class VideoService(IBlobService blobService, VideoFastStartConverter videoFastStartConverter, FrameCatcher frameCatcher, VideoDurationCalculator videoDurationCalculator, TempDirectoryService tempDirectoryService, UniqNameGenerator blobNameGenerator) : IVideoService
    {
        public readonly static int MaxVideoDuration = 120;
        public readonly static long MaxVideoLenghtMB = 150;
        public readonly static long MaxVideoLength = 157286400;//150 mb

        private readonly IBlobService _blobService = blobService;
        private readonly UniqNameGenerator _blobNameGenerator = blobNameGenerator;
        private readonly VideoFastStartConverter _videoFastStartConverter = videoFastStartConverter;
        private readonly FrameCatcher _frameCatcher = frameCatcher;
        private readonly VideoDurationCalculator _videoDurationCalculator = videoDurationCalculator;
        private readonly TempDirectoryService _tempDirectoryService = tempDirectoryService;

        public async Task<AppVideo> SaveAsync(IFormFile file, string containerNameOfVideo, string containerNameOfFrame, CancellationToken cancellationToken)
        {
            using var stream = file.OpenReadStream();

            if (stream.Length <= 0 || stream.Length > MaxVideoLength)
                throw new VideoLengthException();

            //create a temp directory for this scope;
            _tempDirectoryService.Create();

            try
            {
                //add stream to temp directory
                var input = await _tempDirectoryService.AddFile(stream);

                //load video
                var videoCapture = new VideoCapture(input);
                if (!videoCapture.IsOpened())
                    throw new ServerSideException();

                //calculate duration of the video;
                var duration = _videoDurationCalculator.Calculate(videoCapture);
                if (duration > MaxVideoDuration)
                    throw new VideoDurationException();

                //save frame;
                var frame = await _frameCatcher.SaveFrameAsync(videoCapture, containerNameOfFrame, cancellationToken);

                //convert video to fast start;
                var fastStartOutput = await _videoFastStartConverter.Convert(input, cancellationToken);

                //upload fastStartVideo
                var blobName = _blobNameGenerator.Generate();
                using var fastStartVideo = File.OpenRead(fastStartOutput);
                await _blobService.UploadAsync(fastStartVideo, containerNameOfVideo, blobName, cancellationToken);

                //delete the temp directory created for this scope;
                _tempDirectoryService.Delete();

                return new(blobName, duration, frame, stream.Length);
            }
            catch (Exception)
            {
                //delete the temp directory created for this scope;
                _tempDirectoryService.Delete();
                throw;
            }

        }
    }
}

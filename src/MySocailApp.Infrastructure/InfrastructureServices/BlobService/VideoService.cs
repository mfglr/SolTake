using Microsoft.AspNetCore.Http;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.Exceptions;
using MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService
{
    public class VideoService(IBlobService blobService, VideoManipulatorConverter videoFastStartConverter, VideoDurationCalculator videoDurationCalculator, TempDirectoryService tempDirectoryService, UniqNameGenerator blobNameGenerator) : IVideoService
    {
        public readonly static int MaxVideoDuration = 300;
        public readonly static long MaxVideoLenghtMB = 150;
        public readonly static long MaxVideoLength = 157286400;//150 mb

        private readonly IBlobService _blobService = blobService;
        private readonly UniqNameGenerator _blobNameGenerator = blobNameGenerator;
        private readonly VideoManipulatorConverter _videoFastStartConverter = videoFastStartConverter;
        private readonly VideoDurationCalculator _videoDurationCalculator = videoDurationCalculator;
        private readonly TempDirectoryService _tempDirectoryService = tempDirectoryService;

        public async Task<AppVideo> SaveAsync(IFormFile file, string containerName, CancellationToken cancellationToken)
        {
            using var stream = file.OpenReadStream();

            if (stream.Length <= 0 || stream.Length > MaxVideoLength)
                throw new VideoLengthException();

            //create a temp directory for this scope
            _tempDirectoryService.Create();
            
            try
            {
                //add stream to temp directory
                var input = await _tempDirectoryService.AddFile(stream);

                //calculate duration of the video
                var duration = _videoDurationCalculator.Calculate(input);
                if (duration > MaxVideoDuration)
                    throw new VideoDurationException();

                //convert video to fast start;
                var output = await _videoFastStartConverter.Convert(input, cancellationToken);

                //upload fastStartVideo to blob container
                var blobName = _blobNameGenerator.Generate();
                using var fastStartVideo = File.OpenRead(output);
                await _blobService.UploadAsync(fastStartVideo, containerName, blobName, cancellationToken);
                fastStartVideo.Close();

                //delete the temp directory created
                _tempDirectoryService.Delete();

                return new(blobName, duration, stream.Length);
            }
            catch (Exception)
            {
                _tempDirectoryService.Delete();
                throw;
            }

        }
    }
}

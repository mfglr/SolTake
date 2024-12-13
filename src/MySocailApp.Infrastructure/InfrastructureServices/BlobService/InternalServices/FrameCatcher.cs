using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Core.Exceptions;
using OpenCvSharp;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class FrameCatcher(UniqNameGenerator blobNameGenerator, IBlobService blobService)
    {
        private readonly UniqNameGenerator _blobNameGenerator = blobNameGenerator;
        private readonly IBlobService _blobService = blobService;

        public async Task<AppImage> SaveFrameAsync(VideoCapture videoCapture, string containerName, CancellationToken cancellationToken)
        {
            //Catch frame
            using var frame = new Mat();
            videoCapture.Set(VideoCaptureProperties.PosMsec, 0);
            videoCapture.Read(frame);
            if (frame == null)
                throw new ServerSideException();

            //save frame to blob
            var blobName = _blobNameGenerator.Generate("jpeg");
            await _blobService.UploadAsync(frame.ToBytes(), containerName, blobName, cancellationToken);

            return new AppImage(containerName, blobName, new(frame.Height, frame.Width));
        }
    }
}

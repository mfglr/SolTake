using BlobService.Application;
using BlobService.Application.Objects;
using BlobService.Infastructure.InternalServices;
using Microsoft.AspNetCore.Http;
using MySocailApp.Core.Exceptions;
using OpenCvSharp;

namespace BlobService.Infastructure
{
    public class VideoService(ITransactionService transactionService) : IVideoService
    {
        private readonly ITransactionService _transactionService = transactionService;

        public async Task<AppVideo> SaveAsync(IFormFile file, string containerNameOfVideo, string containerNameOfFrame, CancellationToken cancellationToken)
        {
            using var stream = file.OpenReadStream();

            //convert video to fast start;
            var convertedBlobNameOfVideo = await VideoFastStartConverter.Convert(_transactionService, stream, containerNameOfVideo, cancellationToken);

            //load video
            var videoCapture = new VideoCapture(PathFinder.GetPath(RootName.Video, convertedBlobNameOfVideo, convertedBlobNameOfVideo));
            if (!videoCapture.IsOpened()) throw new ServerSideException();

            //save frame;
            var frame = await FrameCatcher.SaveFrameAsync(_transactionService, videoCapture, containerNameOfFrame, cancellationToken);

            //calculate duration of the video;
            var duration = VideoDurationCalculator.Calculate(videoCapture);

            return new(convertedBlobNameOfVideo, duration, frame, stream.Length);
        }

        public void Delete(string containerName, string blobName)
        {
            var path = PathFinder.GetPath(RootName.Video, containerName, blobName);
            if (File.Exists(path))
                File.Delete(path);
        }

        public async Task<byte[]> Read(string containerName, string blobName, int offset, int count, CancellationToken cancellationToken)
        {
            using var stream = File.OpenRead(PathFinder.GetPath(RootName.Video, containerName, blobName));
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
            => File.OpenRead(PathFinder.GetPath(RootName.Video, containerName, blobName));
    }
}

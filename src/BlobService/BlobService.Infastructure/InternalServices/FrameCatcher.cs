using BlobService.Application;
using BlobService.Application.Objects;
using MySocailApp.Core.Exceptions;
using OpenCvSharp;

namespace BlobService.Infastructure.InternalServices
{
    internal static class FrameCatcher
    {
        public static Task<AppImage> SaveFrameAsync(ITransactionService transactionService, VideoCapture videoCapture, string containerName, CancellationToken cancellationToken)
            => Task.Run(
                () =>
                {
                    //Catch frame
                    using var frame = new Mat();
                    videoCapture.Set(VideoCaptureProperties.PosMsec, 0);
                    videoCapture.Read(frame);
                    if (frame == null) throw new ServerSideException();

                    //generate blobName
                    var blobName = BlobNameGenerator.Generate(RootName.Image, containerName, "jpeg");
                    var pathName = PathFinder.GetPath(RootName.Image, containerName, blobName);
                    transactionService.AddFileCreated(pathName);

                    //save frame
                    if (!Cv2.ImWrite(pathName, frame)) throw new ServerSideException();

                    return new AppImage(containerName, blobName, new(frame.Height, frame.Width));
                },
                cancellationToken
            );
    }
}

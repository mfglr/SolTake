using MySocailApp.Application.ApplicationServices.BlobService.Objects;

namespace MySocailApp.Application.ApplicationServices.BlobService
{
    public interface IFrameCatcher
    {
        Task<AppImage> GetFrameAsync(string videoPath, string containerName, double value, CancellationToken cancellationToken);
    }
}

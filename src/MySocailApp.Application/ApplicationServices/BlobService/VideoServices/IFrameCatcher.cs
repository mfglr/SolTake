using MySocailApp.Application.ApplicationServices.BlobService.Objects;

namespace MySocailApp.Application.ApplicationServices.BlobService.VideoServices
{
    public interface IFrameCatcher
    {
        Task<AppImage> GetFrameAsync(string videoPath, string containerName, double value, CancellationToken cancellationToken);
    }
}

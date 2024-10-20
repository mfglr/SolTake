using MySocailApp.Application.InfrastructureServices.BlobService.Objects;

namespace MySocailApp.Application.InfrastructureServices.BlobService.VideoServices
{
    public interface IFrameCatcher
    {
        Task<AppImage> GetFrameAsync(string videoPath, string containerName, double value, CancellationToken cancellationToken);
    }
}

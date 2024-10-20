namespace MySocailApp.Application.InfrastructureServices.BlobService.VideoServices
{
    public interface IVideoFastStartConverter
    {
        Task<string> Convert(string containerName, string blobName, CancellationToken cancellationToken);
    }
}

namespace MySocailApp.Application.ApplicationServices.BlobService.VideoServices
{
    public interface IVideoFastStartConverter
    {
        Task<string> Convert(string containerName, string blobName, CancellationToken cancellationToken);
    }
}

namespace SolTake.Application.InfrastructureServices.BlobService
{
    public interface IImageToBase64Convertor
    {
        Task<string> ToBase64(string containerName, string blobName, CancellationToken cancellationToken);
    }
}

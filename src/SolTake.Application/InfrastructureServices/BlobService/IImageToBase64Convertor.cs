namespace SolTake.Application.InfrastructureServices.BlobService
{
    public interface IImageToBase64Convertor
    {
        Task<string> ToBase64(string containerName, string blobName, CancellationToken cancellationToken);
        Task<string> ToBase64(Stream stream, CancellationToken cancellationToken);
        string ToBase64(byte[] bytes, string format);
    }
}

namespace SolTake.Application.InfrastructureServices.BlobService
{
    public interface IImageToBase64Convertor
    {
        Task<string> ToBase64(Stream stream, string format, CancellationToken cancellationToken);
        string ToBase64(byte[] bytes, string format);
    }
}

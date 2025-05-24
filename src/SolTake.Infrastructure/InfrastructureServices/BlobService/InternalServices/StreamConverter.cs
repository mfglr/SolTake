namespace SolTake.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public static class StreamConverter
    {
        public static async Task<byte[]> ToByteArrayAsync(this Stream stream, CancellationToken cancellationToken)
        {
            var bytes = new byte[stream.Length];
            await stream.ReadExactlyAsync(bytes, cancellationToken);
            return bytes;
        }
    }
}

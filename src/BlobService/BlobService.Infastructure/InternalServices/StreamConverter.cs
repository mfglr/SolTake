namespace BlobService.Infastructure.InternalServices
{
    internal static class StreamConverter
    {
        public static async Task<byte[]> ToByteArrayAsync(this Stream stream, CancellationToken cancellationToken)
        {
            var bytes = new byte[stream.Length];
            await stream.ReadAsync(bytes, cancellationToken);
            return bytes;
        }
    }
}

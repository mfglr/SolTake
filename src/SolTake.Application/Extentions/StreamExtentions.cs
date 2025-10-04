namespace SolTake.Application.Extentions
{
    public static class StreamExtentions
    {
        public static async Task<byte[]> ToByteArrayAsync(this Stream stream, CancellationToken cancellationToken = default)
        {
            var bytes = new byte[stream.Length];
            await stream.ReadExactlyAsync(bytes, cancellationToken);
            return bytes;
        }
    }
}

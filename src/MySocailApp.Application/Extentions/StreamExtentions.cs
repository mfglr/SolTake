namespace MySocailApp.Application.Extentions
{
    public static class StreamExtentions
    {
        public static async Task<byte[]> ToByteArrayAsync(this Stream stream)
        {
            var bytes = new byte[stream.Length];
            await stream.ReadAsync(bytes, 0, bytes.Length);
            return bytes;
        }
}
    }

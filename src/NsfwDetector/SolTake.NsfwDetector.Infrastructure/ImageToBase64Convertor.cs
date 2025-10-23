namespace SolTake.NsfwDetector.Infrastructure
{
    internal class ImageToBase64Convertor
    {
        public async Task<string> ConvertAsync(Stream stream, CancellationToken cancellationToken)
        {
            var bytes = new byte[stream.Length];
            await stream.ReadExactlyAsync(bytes, cancellationToken);
            return $"data:image/jpg;base64,{Convert.ToBase64String(bytes)}";
        }
    }
}

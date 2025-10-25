using Xabe.FFmpeg;

namespace SolTake.ThumbnailGenerator.Infrastructure
{
    public static class FFmpegConfigration
    {
        public static void Configure() =>
                FFmpeg.SetExecutablesPath($"{AppContext.BaseDirectory}/FFmpeg");
    }
}

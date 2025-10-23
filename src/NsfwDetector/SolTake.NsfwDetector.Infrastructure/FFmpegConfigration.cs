using Xabe.FFmpeg;

namespace SolTake.NsfwDetector.Infrastructure
{
    public static class FFmpegConfigration
    {
        public static void Configure() =>
                FFmpeg.SetExecutablesPath($"{AppContext.BaseDirectory}/FFmpeg");
    }
}

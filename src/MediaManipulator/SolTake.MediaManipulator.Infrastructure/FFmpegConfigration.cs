using Xabe.FFmpeg;

namespace SolTake.MediaManipulator.Infrastructure
{
    public static class FFmpegConfigration
    {
        public static void Configure() =>
            FFmpeg.SetExecutablesPath($"{AppContext.BaseDirectory}/FFmpeg");
    }
}

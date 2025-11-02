namespace SolTake.Core
{
    public record Dimention(double Width, double Height)
    {
        public bool IsPortrait() =>
            Height > Width;

        public bool IsScaleDownRequired(double size) =>
            Height > Width ? Height > size : Width > size;
    }
}

using BlobService.Application.Objects;

namespace BlobService.Infastructure.InternalServices
{
    internal static class DimentionCalculator
    {
        public static Dimention Calculate(SixLabors.ImageSharp.Image image)
            => new(image.Height, image.Width);
    }
}

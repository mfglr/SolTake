using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using SixLabors.ImageSharp;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService.InternalServices
{
    public class DimentionCalculator
    {
        public Dimention Calculate(Image image) => new(image.Height, image.Width);
    }
}

using MySocailApp.Application.Services.BlobService;

namespace MySocailApp.Infrastructure.Services.BlobService
{
    public class DimentionCalculator : IDimentionCalculator
    {
        public Dimention Calculate(Stream stream)
        {
            using var image = System.Drawing.Image.FromStream(stream);
            if (image == null)
                return new Dimention(0, 0);
            return new(image.Height, image.Width);
        }
    }
}

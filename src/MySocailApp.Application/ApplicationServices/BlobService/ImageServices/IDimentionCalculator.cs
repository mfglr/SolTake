using MySocailApp.Application.ApplicationServices.BlobService.Objects;

namespace MySocailApp.Application.ApplicationServices.BlobService.ImageServices
{
    public interface IDimentionCalculator
    {
        Dimention Calculate(Stream stream);
    }
}

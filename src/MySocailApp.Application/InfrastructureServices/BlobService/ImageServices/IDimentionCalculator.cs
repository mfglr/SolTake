using MySocailApp.Application.InfrastructureServices.BlobService.Objects;

namespace MySocailApp.Application.InfrastructureServices.BlobService.ImageServices
{
    public interface IDimentionCalculator
    {
        Dimention Calculate(Stream stream);
    }
}

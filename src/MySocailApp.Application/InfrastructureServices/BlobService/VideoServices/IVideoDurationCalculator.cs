namespace MySocailApp.Application.InfrastructureServices.BlobService.VideoServices
{
    public interface IVideoDurationCalculator
    {
        Task<double> CalculateAsync(string path, CancellationToken cancellationToken);
    }
}

namespace MySocailApp.Application.ApplicationServices.BlobService
{
    public interface IVideoDurationCalculator
    {
        Task<double> CalculateAsync(string path, CancellationToken cancellationToken);
    }
}

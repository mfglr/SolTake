namespace MySocailApp.Application.ApplicationServices.BlobService.VideoServices
{
    public interface IVideoDurationCalculator
    {
        Task<double> CalculateAsync(string path, CancellationToken cancellationToken);
    }
}

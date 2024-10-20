namespace MySocailApp.Application.InfrastructureServices.BlobService
{
    public interface IBlobNameGenerator
    {
        string Generate(string root, string containerName, string? extention = null);
    }
}

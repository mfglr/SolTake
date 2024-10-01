namespace MySocailApp.Application.ApplicationServices.BlobService
{
    public interface IBlobNameGenerator
    {
        string Generate(string root,string containerName,string? extention = null);
    }
}

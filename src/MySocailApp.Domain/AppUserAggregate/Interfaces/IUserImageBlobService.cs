namespace MySocailApp.Domain.AppUserAggregate.Interfaces
{
    public interface IUserImageBlobService
    {
        Task UploadAsync(string blobName, Stream stream, CancellationToken cancellationToken);
        Stream Read(string blobName);
        Stream ReadDefault();
    }
}

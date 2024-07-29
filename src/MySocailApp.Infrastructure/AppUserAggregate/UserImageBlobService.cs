using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Infrastructure.AppUserAggregate
{
    public class UserImageBlobService : IUserImageBlobService
    {
        private static readonly string _rootPath = "Images";
        private static readonly string _containerName = "ProfileImages";
        private static readonly string _defaultProfileImagePath = $"{_rootPath}/DefaultProfileImages/no_profile_image.png";

        private string GetPath(string blobName) => $"{_rootPath}/{_containerName}/{blobName}";

        public async Task UploadAsync(string blobName, Stream stream, CancellationToken cancellationToken)
        {
            var path = GetPath(blobName);
            try
            {
                using var fileStream = File.Create(path);
                await stream.CopyToAsync(fileStream, cancellationToken);
            }
            catch (Exception)
            {
                if (File.Exists(path))
                    File.Delete(path);
                throw;
            }
        }

        public Stream Read(string blobName) => File.OpenRead(GetPath(blobName));
        public Stream ReadDefault() => File.OpenRead(_defaultProfileImagePath);
    }
}

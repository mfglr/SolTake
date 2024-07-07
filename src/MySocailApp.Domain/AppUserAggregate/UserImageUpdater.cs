using MySocailApp.Application.Services;
using MySocailApp.Domain.AppUserAggregate.Exceptions;

namespace MySocailApp.Domain.AppUserAggregate
{
    public class UserImageUpdater(IUserImageBlobService userImageBlobService, IUserImageBlobNameGenerator userImageBlobNameGenerator)
    {
        private readonly IUserImageBlobService _userImageBlobService = userImageBlobService;
        private readonly IUserImageBlobNameGenerator _userImageBlobNameGenerator = userImageBlobNameGenerator;

        public async Task UpdateAsync(AppUser user, Stream stream, CancellationToken cancellationToken)
        {
            if (stream.Length == 0)
                throw new EmptyUserImageException();

            string blobName = _userImageBlobNameGenerator.Generate();
            var userImage = new UserImage(blobName, DateTime.UtcNow);
            user.UpdateImage(userImage);

            await _userImageBlobService.UploadAsync(blobName, stream, cancellationToken);
        }
    }
}

namespace MySocailApp.Domain.AppUserAggregate
{
    public class UserImageReader(IUserImageBlobService userImageBlobService)
    {
        private readonly IUserImageBlobService _userImageBlobService = userImageBlobService;

        public Stream Read(AppUser user)
        {
            if (user.Image != null)
                return _userImageBlobService.Read(user.Image.BlobName);
            return _userImageBlobService.ReadDefault();
        }
    }
}

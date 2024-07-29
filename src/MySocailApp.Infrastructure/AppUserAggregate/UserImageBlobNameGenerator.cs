using MySocailApp.Domain.AppUserAggregate.Interfaces;

namespace MySocailApp.Infrastructure.AppUserAggregate
{
    public class UserImageBlobNameGenerator : IUserImageBlobNameGenerator
    {
        public string Generate() => $"{Guid.NewGuid()}_{DateTime.UtcNow.Ticks}";
    }
}

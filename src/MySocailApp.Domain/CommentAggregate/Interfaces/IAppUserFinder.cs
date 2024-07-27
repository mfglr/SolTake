using MySocailApp.Domain.AppUserAggregate;

namespace MySocailApp.Domain.CommentAggregate.Interfaces
{
    public interface IAppUserFinder
    {
        Task<List<AppUser>> GetByUserNames(IEnumerable<string> userNames, CancellationToken cancellationToken);
    }
}

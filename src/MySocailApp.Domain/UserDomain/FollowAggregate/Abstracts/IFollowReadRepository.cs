namespace MySocailApp.Domain.UserDomain.FollowAggregate.Abstracts
{
    public interface IFollowReadRepository
    {
        Task<bool> ExistAsync(int followerId, int followedId, CancellationToken cancellationToken);
    }
}

namespace MySocailApp.Domain.FollowAggregate.Abstracts
{
    public interface IFollowReadRepository
    {
        Task<bool> ExistAsync(int followerId, int followedId, CancellationToken cancellationToken);
    }
}

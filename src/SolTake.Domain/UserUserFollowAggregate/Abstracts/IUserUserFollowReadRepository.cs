namespace SolTake.Domain.UserUserFollowAggregate.Abstracts
{
    public interface IUserUserFollowReadRepository
    {
        Task<bool> ExistAsync(int followerId, int followedId, CancellationToken cancellationToken);
    }
}

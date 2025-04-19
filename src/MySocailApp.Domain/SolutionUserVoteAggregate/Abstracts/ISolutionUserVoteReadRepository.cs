namespace MySocailApp.Domain.SolutionUserVoteAggregate.Abstracts
{
    public interface ISolutionUserVoteReadRepository
    {
        Task<bool> ExistAsync(int solutionId, int userId, CancellationToken cancellationToken);
    }
}

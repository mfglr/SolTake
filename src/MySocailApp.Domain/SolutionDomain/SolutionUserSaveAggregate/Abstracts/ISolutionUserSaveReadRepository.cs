namespace MySocailApp.Domain.SolutionDomain.SolutionUserSaveAggregate.Abstracts
{
    public interface ISolutionUserSaveReadRepository
    {
        Task<bool> ExistAsync(int solutionId, int userId,CancellationToken cancellationToken);
    }
}

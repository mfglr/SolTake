namespace SolTake.Application.InfrastructureServices
{
    public interface IUnitOfWork
    {
        Task CommitAsync(CancellationToken cancellationToken);
        void Clear();
    }
}

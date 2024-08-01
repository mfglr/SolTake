namespace MySocailApp.Domain.Shared
{
    public interface IUnitOfWork
    {
        Task CommitAsync(CancellationToken cancellationToken);
        void Clear();
    }
}

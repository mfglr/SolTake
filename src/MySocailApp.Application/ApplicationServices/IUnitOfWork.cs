namespace MySocailApp.Application.ApplicationServices
{
    public interface IUnitOfWork
    {
        Task CommitAsync(CancellationToken cancellationToken);
        void Clear();
    }
}

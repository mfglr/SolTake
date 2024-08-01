using Microsoft.EntityFrameworkCore.Storage;

namespace MySocailApp.Domain.Shared
{
    public interface ITransactionCreator
    {
        Task<IDbContextTransaction> CreateTransactionAsync(CancellationToken cancellationToken);
    }
}

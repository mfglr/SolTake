using Microsoft.EntityFrameworkCore.Storage;

namespace MySocailApp.Domain.AccountAggregate
{
    public interface ITransactionCreator
    {
        Task<IDbContextTransaction> CreateTransactionAsync(CancellationToken cancellationToken);
    }
}

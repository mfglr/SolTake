using Microsoft.EntityFrameworkCore.Storage;

namespace MySocailApp.Domain.AccountAggregate.Abstracts
{
    public interface ITransactionCreator
    {
        Task<IDbContextTransaction> CreateTransactionAsync(CancellationToken cancellationToken);
    }
}

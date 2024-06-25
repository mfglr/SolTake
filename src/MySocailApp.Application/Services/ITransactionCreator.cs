using Microsoft.EntityFrameworkCore.Storage;

namespace MySocailApp.Application.Services
{
    public interface ITransactionCreator
    {
        Task<IDbContextTransaction> CreateTransactionAsync(CancellationToken cancellationToken);
    }
}

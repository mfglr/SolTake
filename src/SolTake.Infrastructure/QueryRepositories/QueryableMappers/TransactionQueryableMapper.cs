using SolTake.Application.Queries.TransactionAggregate;
using SolTake.Domain.TransactionAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class TransactionQueryableMapper
    {
        public static IQueryable<TransactionResponseDto> ToTransactionResponseDto(this IQueryable<Transaction> query) =>
            query
                .Select(
                    transaction => new TransactionResponseDto(
                        transaction.Id,
                        transaction.CreatedAt,
                        transaction.NumberOfSol
                    )
                );
    }
}

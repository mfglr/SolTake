using MySocailApp.Application.Queries.TransactionAggregate;
using MySocailApp.Domain.TransactionAggregate.Entities;
using MySocailApp.Infrastructure.DbContexts;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class TransactionQueryableMapper
    {
        public static IQueryable<TransactionResponseDto> ToTransactionResponseDto(this IQueryable<Transaction> query, AppDbContext context) =>
            query
                .Join(
                    context.AIModels,
                    transaction => transaction.AIModelId,
                    aiModel => aiModel.Id,
                    (transaction, aiModel) => new TransactionResponseDto(
                        transaction.Id,
                        transaction.CreatedAt,
                        transaction.BalanceId,
                        transaction.NumberOfInputToken,
                        transaction.NumberOfOutputToken,
                        transaction.SolPerInputToken,
                        transaction.SolPerOutputToken,
                        aiModel.Name.Value,
                        aiModel.Image
                    )
                );
    }
}

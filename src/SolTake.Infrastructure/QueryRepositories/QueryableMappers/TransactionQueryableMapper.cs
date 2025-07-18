﻿using SolTake.Application.Queries.TransactionAggregate;
using SolTake.Domain.TransactionAggregate.Entities;
using SolTake.Infrastructure.DbContexts;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    internal static class TransactionQueryableMapper
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

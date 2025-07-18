﻿using SolTake.Application.Queries.BalanceAggregate.GetBalance;
using SolTake.Domain.BalanceAggregate.Entities;

namespace SolTake.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class BalanceQueryableMapper
    {
        public static IQueryable<BalanceResponseDto> ToBalanceResponseDto(this IQueryable<Balance> query)
            => query.Select(x => new BalanceResponseDto(x.Credit.Amount));
    }
}

using MySocailApp.Application.Queries.BalanceAggregate.GetBalance;
using SolTake.Domain.BalanceAggregate.Entities;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class BalanceQueryableMapper
    {
        public static IQueryable<BalanceResponseDto> ToBalanceResponseDto(this IQueryable<Balance> query)
            => query.Select(x => new BalanceResponseDto(x.Credit.Amount));
    }
}

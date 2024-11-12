using MySocailApp.Application.Queries.VersionAggregate;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class VersionQuerableMapper
    {
        public static IQueryable<VersionResponseDto> ToVersionResponseDto(this IQueryable<Domain.VersionAggregate.Entities.Version> query)
            => query.Select(x => new VersionResponseDto(x.Id, x.CreatedAt, x.Code, x.IsUpgradeRequired));
    }
}

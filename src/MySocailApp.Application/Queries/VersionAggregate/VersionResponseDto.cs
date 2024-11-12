namespace MySocailApp.Application.Queries.VersionAggregate
{
    public record VersionResponseDto(int Id, DateTime CreatedAt, int Code, bool IsUpgradeRequired);
}

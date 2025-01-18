namespace MySocailApp.Application.Queries.SolutionAggregate
{
    public record SolutionUserSaveResponseDto(int Id, DateTime CreatedAt, int SolutionId, int UserId, SolutionResponseDto Solution);
}

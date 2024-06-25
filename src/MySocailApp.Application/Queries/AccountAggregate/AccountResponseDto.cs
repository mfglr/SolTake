namespace MySocailApp.Application.Queries.AccountAggregate
{
    public record AccountResponseDto(string Id,DateTime CreatedAt,DateTime? UpdatedAt,string UserName,string Email);
}

using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.SearchUsers
{
    public record SearchUserDto(string Key,string? LastId) : IRequest<List<AppUserResponseDto>>;
}

using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.SearchUsers
{
    public record SearchUserDto(string Key,int? LastId) : IRequest<List<AppUserResponseDto>>;
}

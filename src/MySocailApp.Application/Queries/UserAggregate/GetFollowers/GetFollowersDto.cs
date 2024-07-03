using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowers
{
    public record GetFollowersDto(string? LastId) : IRequest<List<AppUserResponseDto>>;
}

using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowers
{
    public record GetFollowersDto(int? LastId) : IRequest<List<AppUserResponseDto>>;
}

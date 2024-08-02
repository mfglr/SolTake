using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowers
{
    public record GetFollowersDto(int? LastValue) : IRequest<List<AppUserResponseDto>>;
}

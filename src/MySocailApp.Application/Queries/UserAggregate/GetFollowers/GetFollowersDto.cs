using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowers
{
    public record GetFollowersDto(int? LastValue, int? Take) : IRequest<List<AppUserResponseDto>>;
}

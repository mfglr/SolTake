using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowersById
{
    public record GetFollowersByIdDto(int Id, int? LastValue) : IRequest<List<AppUserResponseDto>>;
}

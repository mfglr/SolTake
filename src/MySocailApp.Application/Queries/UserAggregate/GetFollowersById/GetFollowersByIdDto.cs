using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowersById
{
    public record GetFollowersByIdDto(string id,string? LastId) : IRequest<List<AppUserResponseDto>>;
}

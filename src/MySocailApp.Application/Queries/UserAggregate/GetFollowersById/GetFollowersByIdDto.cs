using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowersById
{
    public record GetFollowersByIdDto(int Id, int? LastValue, int? Take) : IRequest<List<AppUserResponseDto>>;
}

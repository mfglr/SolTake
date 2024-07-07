using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetFolloweds
{
    public record GetFollowedsDto(int? LastId) : IRequest<List<AppUserResponseDto>>;
}

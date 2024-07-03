using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetFolloweds
{
    public record GetFollowedsDto(string? LastId) : IRequest<List<AppUserResponseDto>>;
}

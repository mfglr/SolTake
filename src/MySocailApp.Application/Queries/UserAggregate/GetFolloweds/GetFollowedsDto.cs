using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetFolloweds
{
    public record GetFollowedsDto(int? LastValue, int? Take) : IRequest<List<AppUserResponseDto>>;
}

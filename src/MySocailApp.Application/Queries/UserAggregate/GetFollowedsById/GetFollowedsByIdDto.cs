using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowedsById
{
    public record GetFollowedsByIdDto(string Id, string? LastId) : IRequest<List<AppUserResponseDto>>;
}

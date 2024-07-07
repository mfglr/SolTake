using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowedsById
{
    public record GetFollowedsByIdDto(int Id, int? LastId) : IRequest<List<AppUserResponseDto>>;
}

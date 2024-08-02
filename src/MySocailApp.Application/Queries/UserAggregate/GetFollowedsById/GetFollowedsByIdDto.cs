using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowedsById
{
    public record GetFollowedsByIdDto(int Id, int? LastValue) : IRequest<List<AppUserResponseDto>>;
}

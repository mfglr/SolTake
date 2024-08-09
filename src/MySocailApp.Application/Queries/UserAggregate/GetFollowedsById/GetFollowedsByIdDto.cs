using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetFollowedsById
{
    public record GetFollowedsByIdDto(int Id, int? LastValue, int? Take) : IRequest<List<AppUserResponseDto>>;
}

using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetNotFolloweds
{
    public record GetNotFollowedsDto(int Id,int? LastValue,int? Take) : IRequest<List<AppUserResponseDto>>;
}

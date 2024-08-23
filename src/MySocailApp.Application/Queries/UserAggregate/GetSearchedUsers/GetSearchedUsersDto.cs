using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetSearchedUsers
{
    public record GetSearchedUsersDto(int? Offset,int Take) : IRequest<List<AppUserResponseDto>>;
}

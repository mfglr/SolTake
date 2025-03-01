using MediatR;

namespace MySocailApp.Application.Queries.UserDomain.UserAggregate.GetSearchedUsers
{
    public class GetSearchedUsersDto(int? offset, int take, bool isDescending) : Core.Page(offset, take, isDescending), IRequest<List<UserSearchResponseDto>>;
}

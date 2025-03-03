using MediatR;

namespace MySocailApp.Application.Queries.UserDomain.GetUsersSearched
{
    public class GetUsersSearchedDto(int? offset, int take, bool isDescending) : Core.Page(offset, take, isDescending), IRequest<List<UserSearchedResponseDto>>;
}

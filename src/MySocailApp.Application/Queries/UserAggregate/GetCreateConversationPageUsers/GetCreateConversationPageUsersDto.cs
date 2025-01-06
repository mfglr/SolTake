using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserAggregate.GetCreateConversationPageUsers
{
    public class GetCreateConversationPageUsersDto(int offset,int take,bool isDescending) : Page(offset,take,isDescending), IRequest<List<UserResponseDto>>;
}

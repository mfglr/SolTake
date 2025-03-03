using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserDomain.GetConversationPageUsers
{
    public class GetConversationPageUsersDto(int? offset, int take, bool isDescending) : Page(offset, take, isDescending), IRequest<List<UserResponseDto>>;
}

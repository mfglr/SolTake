using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.UserAggregate.GetNotFolloweds
{
    public class GetNotFollowedsDto(int id,int offset,int take,bool isDescending) : Page(offset,take,isDescending), IRequest<List<AppUserResponseDto>>
    {
        public int Id { get; private set; } = id;
    }
}

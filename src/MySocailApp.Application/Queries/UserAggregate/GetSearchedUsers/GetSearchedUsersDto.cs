using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetSearchedUsers
{
    public record GetSearchedUsersDto(int? LastValue,int? Take) : IRequest<List<AppUserResponseDto>>;
}

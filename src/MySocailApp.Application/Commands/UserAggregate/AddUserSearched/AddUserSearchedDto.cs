using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.AddUserSearched
{
    public record AddUserSearchedDto(int SearchedId) : IRequest<UserSearchResponseDto>;
}

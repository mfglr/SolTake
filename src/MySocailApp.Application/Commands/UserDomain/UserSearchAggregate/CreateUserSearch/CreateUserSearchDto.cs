using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserSearchAggregate.CreateUserSearch
{
    public record CreateUserSearchDto(int SearchedId) : IRequest<CreateUserSearchResponseDto>;
}

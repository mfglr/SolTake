using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserSearchAggregate.DeleteUserSearch
{
    public record DeleteUserSearchDto(int SearchedId) : IRequest;
}

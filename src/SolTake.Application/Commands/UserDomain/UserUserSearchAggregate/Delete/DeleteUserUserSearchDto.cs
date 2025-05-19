using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserUserSearchAggregate.Delete
{
    public record DeleteUserUserSearchDto(int SearchedId) : IRequest;
}

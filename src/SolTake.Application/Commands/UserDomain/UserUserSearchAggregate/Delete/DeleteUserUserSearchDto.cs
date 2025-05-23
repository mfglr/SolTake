using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserUserSearchAggregate.Delete
{
    public record DeleteUserUserSearchDto(int SearchedId) : IRequest;
}

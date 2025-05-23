using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserUserSearchAggregate.Create
{
    public record CreateUserUserSearchDto(int SearchedId) : IRequest<CreateUserUserSearchResponseDto>;
}

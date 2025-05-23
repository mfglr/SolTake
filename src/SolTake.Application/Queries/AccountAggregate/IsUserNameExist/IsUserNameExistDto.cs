using MediatR;

namespace SolTake.Application.Queries.AccountAggregate.IsUserNameExist
{
    public record IsUserNameExistDto(string UserName) : IRequest<bool>;
}

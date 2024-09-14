using MediatR;

namespace MySocailApp.Application.Queries.AccountAggregate.IsUserNameExist
{
    public record IsUserNameExistDto(string UserName) : IRequest<bool>;
}

using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.IsUserNameExist
{
    public record IsUserNameExistDto(string UserName) : IRequest<bool>;
}

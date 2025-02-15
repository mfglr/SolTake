using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateUserName
{
    public record UpdateUserNameDto(string UserName) : IRequest;
}

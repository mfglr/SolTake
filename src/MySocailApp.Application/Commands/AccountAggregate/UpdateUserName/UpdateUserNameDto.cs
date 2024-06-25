using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateUserName
{
    public record UpdateUserNameDto(string UserName) : IRequest<LoginResponseDto>;
}

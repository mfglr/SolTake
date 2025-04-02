using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateUserName
{
    public record UpdateUserNameDto(string UserName) : IRequest<UpdateUserNameResponseDto>;
}

using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.UpdateUserName
{
    public record UpdateUserNameDto(string UserName) : IRequest<UpdateUserNameResponseDto>;
}

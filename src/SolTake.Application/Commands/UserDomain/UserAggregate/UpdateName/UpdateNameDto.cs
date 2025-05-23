using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.UpdateName
{
    public record UpdateNameDto(string Name) : IRequest<UpdateNameResponseDto>;
}

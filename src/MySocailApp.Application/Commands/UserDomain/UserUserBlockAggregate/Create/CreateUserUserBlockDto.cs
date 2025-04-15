using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserUserBlockAggregate.Create
{
    public record CreateUserUserBlockDto(int BlockedId) : IRequest<CreateUserUserBlockResponseDto>;
}

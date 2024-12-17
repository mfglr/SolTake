using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.Block
{
    public record BlockDto(int BlockedId) : IRequest<BlockCommandResponseDto>;
}

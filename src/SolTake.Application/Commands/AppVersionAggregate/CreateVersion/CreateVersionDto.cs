using MediatR;

namespace SolTake.Application.Commands.AppVersionAggregate.CreateVersion
{
    public record CreateVersionDto(string Code, bool IsUpgradeRequired) : IRequest;
}

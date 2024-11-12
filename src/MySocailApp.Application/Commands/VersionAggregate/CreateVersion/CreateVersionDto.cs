using MediatR;

namespace MySocailApp.Application.Commands.VersionAggregate.CreateVersion
{
    public record CreateVersionDto(int Code, bool IsUpgradeRequired) : IRequest;
}

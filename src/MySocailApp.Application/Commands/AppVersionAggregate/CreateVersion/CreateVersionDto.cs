using MediatR;

namespace MySocailApp.Application.Commands.AppVersionAggregate.CreateVersion
{
    public record CreateVersionDto(string Code, bool IsUpgradeRequired) : IRequest;
}

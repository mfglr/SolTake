using MediatR;

namespace MySocailApp.Application.Queries.AppVersionAggregate.IsUpgradeRequired
{
    public record IsUpgradeRequiredDto(string Code) : IRequest<bool>;
}

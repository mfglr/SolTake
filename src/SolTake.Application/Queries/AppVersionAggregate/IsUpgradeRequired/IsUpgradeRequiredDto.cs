using MediatR;

namespace SolTake.Application.Queries.AppVersionAggregate.IsUpgradeRequired
{
    public record IsUpgradeRequiredDto(string Code) : IRequest<bool>;
}

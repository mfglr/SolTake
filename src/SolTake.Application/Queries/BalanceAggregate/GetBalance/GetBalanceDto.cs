using MediatR;

namespace SolTake.Application.Queries.BalanceAggregate.GetBalance
{
    public record GetBalanceDto(int Id) : IRequest<BalanceResponseDto>;
}

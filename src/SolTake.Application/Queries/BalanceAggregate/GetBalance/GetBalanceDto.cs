using MediatR;

namespace MySocailApp.Application.Queries.BalanceAggregate.GetBalance
{
    public record GetBalanceDto(int Id) : IRequest<BalanceResponseDto>;
}

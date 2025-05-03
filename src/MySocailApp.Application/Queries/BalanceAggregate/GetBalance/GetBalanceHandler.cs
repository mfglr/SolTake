using MediatR;
using MySocailApp.Application.QueryRepositories;

namespace MySocailApp.Application.Queries.BalanceAggregate.GetBalance
{
    public class GetBalanceHandler(IBalanceQueryRepository balanceQueryRepository) : IRequestHandler<GetBalanceDto, BalanceResponseDto>
    {
        private readonly IBalanceQueryRepository _balanceQueryRepository = balanceQueryRepository;

        public Task<BalanceResponseDto> Handle(GetBalanceDto request, CancellationToken cancellationToken)
            => _balanceQueryRepository.GetBalanceAsync(request.Id,cancellationToken);
    }
}

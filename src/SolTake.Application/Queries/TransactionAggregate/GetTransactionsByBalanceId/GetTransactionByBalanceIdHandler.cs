﻿using MediatR;
using SolTake.Application.QueryRepositories;

namespace SolTake.Application.Queries.TransactionAggregate.GetTransactionsByBalanceId
{
    public class GetTransactionByBalanceIdHandler(ITransactionQueryRepository transactionQueryRepository) : IRequestHandler<GetTransationsByBalanceIdDto, List<TransactionResponseDto>>
    {
        private readonly ITransactionQueryRepository _transactionQueryRepository = transactionQueryRepository;

        public Task<List<TransactionResponseDto>> Handle(GetTransationsByBalanceIdDto request, CancellationToken cancellationToken)
            => _transactionQueryRepository.GetTransactionsByBalanceId(request.BalanceId, request, cancellationToken);
    }
}

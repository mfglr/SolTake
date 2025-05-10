using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.TransactionAggregate.GetTransactionsByBalanceId
{
    public record GetTransationsByBalanceIdDto(int BalanceId, int? Offset, int Take, bool IsDescending) : Page(Offset, Take, IsDescending), IRequest<List<TransactionResponseDto>>;
}

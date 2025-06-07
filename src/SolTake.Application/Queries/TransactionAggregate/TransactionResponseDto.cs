using SolTake.Core;

namespace SolTake.Application.Queries.TransactionAggregate
{
    public record TransactionResponseDto(int Id, DateTime CreatedAt, int NumberOfSol);
}

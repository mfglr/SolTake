using SolTake.Core;

namespace SolTake.Application.Queries.TransactionAggregate
{
    public record TransactionResponseDto(int Id, DateTime CreatedAt, int BalanceId, int NumberOfInputToken, int NumberOfOutputToken, int SolPerInputToken, int SolPerOutputToken, string AiModelName, Multimedia AiModelImage);
}

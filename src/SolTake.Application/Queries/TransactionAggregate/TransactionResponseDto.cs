using SolTake.Core;

namespace MySocailApp.Application.Queries.TransactionAggregate
{
    public record TransactionResponseDto(int Id, DateTime CreatedAt, int BalanceId, int NumberOfInputToken, int NumberOfOutputToken, int SolPerInputToken, int SolPerOutputToken, string AiModelName, Multimedia AiModelImage);
}

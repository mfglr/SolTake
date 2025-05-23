using SolTake.Core;

namespace SolTake.Application.Queries.AIModelAggregate
{
    public record AIModelResponseDto(int Id, string Name, int SolPerInputToken, int SolPerOutputToken, Multimedia Image, double Commission);
}

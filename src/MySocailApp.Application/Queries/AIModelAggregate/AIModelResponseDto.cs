using MySocailApp.Core;

namespace MySocailApp.Application.Queries.AIModelAggregate
{
    public record AIModelResponseDto(int Id, string Name, int SolPerInputToken, int SolPerOutputToken, Multimedia Image);
}

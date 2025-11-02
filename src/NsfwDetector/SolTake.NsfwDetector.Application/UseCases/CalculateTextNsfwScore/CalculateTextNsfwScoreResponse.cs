using SolTake.Core.Media;

namespace SolTake.NsfwDetector.Application.UseCases.CalculateTextNsfwScore
{
    public record CalculateTextNsfwScoreResponse(IEnumerable<NsfwScore> Scores);
}

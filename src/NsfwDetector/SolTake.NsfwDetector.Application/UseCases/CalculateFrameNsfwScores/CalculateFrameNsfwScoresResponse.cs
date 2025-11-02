using SolTake.Core.Media;

namespace SolTake.NsfwDetector.Application.UseCases.CalculateFrameNsfwScores
{
    public record CalculateFrameNsfwScoresResponse(IEnumerable<NsfwScore> Scores);
}

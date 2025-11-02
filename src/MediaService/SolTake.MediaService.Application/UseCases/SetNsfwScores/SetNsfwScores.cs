using SolTake.Core.Media;

namespace SolTake.MediaService.Application.UseCases.SetNsfwScores
{
    public record SetNsfwScores(Guid Id, IEnumerable<NsfwScore> Scores);
}

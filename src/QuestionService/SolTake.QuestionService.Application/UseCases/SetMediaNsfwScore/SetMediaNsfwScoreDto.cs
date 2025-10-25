using SolTake.Core.Media;

namespace SolTake.QuestionService.Application.UseCases.SetMediaNsfwScore
{
    public record SetMediaNsfwScoreDto(Guid QuestionId, string BlobName, IEnumerable<NsfwScore> Scores);
}

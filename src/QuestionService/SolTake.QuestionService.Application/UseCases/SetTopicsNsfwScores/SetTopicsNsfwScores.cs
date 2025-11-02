using SolTake.Core.Media;

namespace SolTake.QuestionService.Application.UseCases.SetTopicsNsfwScores
{
    public record SetTopicsNsfwScores(Guid Id, IEnumerable<IEnumerable<NsfwScore>> Scores);
}

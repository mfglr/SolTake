using SolTake.Core;

namespace SolTake.QuestionService.Application.UseCases.SetMediaDimentions
{
    public record SetMediaDimentions(Guid Id, IEnumerable<Dimention> Dimentions);
}

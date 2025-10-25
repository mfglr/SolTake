namespace SolTake.Core.Events.QuestionEvents
{
    public record QuestionMediaDimentionCalculated(Guid Id, IEnumerable<Dimention> Dimentions);
}

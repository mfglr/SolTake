namespace SolTake.Core.Events.CreateQuestion
{
    public record QuestionCreatedEvent(Guid QuestionId, string? Content);
}

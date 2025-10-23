namespace SolTake.QuestionService.Infrastructure
{
    public class ConcurrencyException() : Exception("Conflict detected.");
}

namespace SolTake.QuestionService.Domain.Exceptions
{
    public class QuestionIsNotDraftException() : Exception("The question has not been marked as draft before!");
}

namespace MySocailApp.Domain.QuestionUserLikeAggregate.Abstracts
{
    public interface IQuestionUserLikeReadRepository
    {
        Task<bool> IsLikedAsync(int questionId, int userId, CancellationToken cancellationToken);
    }
}

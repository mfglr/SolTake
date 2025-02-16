namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Abstracts
{
    public interface IQuestionUserLikeReadRepository
    {
        Task<bool> IsLikedAsync(int questionId, int userId, CancellationToken cancellationToken);
    }
}

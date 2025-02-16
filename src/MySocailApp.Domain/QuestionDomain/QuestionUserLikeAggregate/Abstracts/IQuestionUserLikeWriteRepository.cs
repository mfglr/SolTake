using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;

namespace MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Abstracts
{
    public interface IQuestionUserLikeWriteRepository
    {
        Task CreateAsync(QuestionUserLike like,CancellationToken cancellationToken);
        void Delete(QuestionUserLike like);
        Task<QuestionUserLike?> GetAsync(int questionId,int userId,CancellationToken cancellationToken);
    }
}

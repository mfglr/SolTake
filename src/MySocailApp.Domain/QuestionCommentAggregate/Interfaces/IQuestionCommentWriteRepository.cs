using MySocailApp.Domain.QuestionCommentAggregate.Entities;

namespace MySocailApp.Domain.QuestionCommentAggregate.Interfaces
{
    public interface IQuestionCommentWriteRepository
    {
        Task CreateAsync(QuestionComment comment, CancellationToken cancellationToken);
        Task<QuestionComment?> GetWithLikeByIdAsync(int id,int userId,CancellationToken cancellationToken);
    }
}

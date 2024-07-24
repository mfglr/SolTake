using MySocailApp.Domain.QuestionCommentAggregate.Entities;

namespace MySocailApp.Domain.QuestionCommentAggregate.Interfaces
{
    public interface IQuestionCommentReadRepository
    {
        Task<QuestionComment?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<List<QuestionComment>> GetByQuestionIdAsync(int questionId,int? lastId,CancellationToken cancellationToken);
    }
}

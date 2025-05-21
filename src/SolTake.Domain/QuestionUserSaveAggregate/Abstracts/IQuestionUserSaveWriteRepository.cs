using SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Entities;

namespace SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Abstracts
{
    public interface IQuestionUserSaveWriteRepository
    {
        Task CreateAsync(QuestionUserSave questionUserSave,CancellationToken cancellationToken);
        void Delete(QuestionUserSave questionUserSave);
        void DeleteRange(IEnumerable<QuestionUserSave> questionUserSaves);

        Task<QuestionUserSave?> GetAsync(int questionId, int userId, CancellationToken cancellationToken);
        Task<List<QuestionUserSave>> GetAsync(IEnumerable<int> questionIds, int userId, CancellationToken cancellationToken);
        Task<List<QuestionUserSave>> GetByUserId(int userId, CancellationToken cancellationToken);
        Task<List<QuestionUserSave>> GetByUserIds(IEnumerable<int> userIds, CancellationToken cancellationToken);
    }
}

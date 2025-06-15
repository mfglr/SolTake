using SolTake.Domain.ExamAggregate.Entitities;

namespace SolTake.Domain.ExamAggregate.Interfaces
{
    public interface IExamReadRepository
    {
        Task<bool> ExistAsync(int id, CancellationToken cancellationToken);
        Task<Exam?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<List<Exam>> GetAllAsync(CancellationToken cancellationToken);
    }
}

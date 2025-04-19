using MySocailApp.Domain.ExamAggregate.Entitities;

namespace MySocailApp.Domain.ExamAggregate.Interfaces
{
    public interface IExamReadRepository
    {
        Task<Exam?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<List<Exam>> GetAllAsync(CancellationToken cancellationToken);
    }
}

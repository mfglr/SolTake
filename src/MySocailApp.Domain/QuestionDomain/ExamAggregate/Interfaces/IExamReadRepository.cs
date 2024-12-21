using MySocailApp.Domain.QuestionDomain.ExamAggregate.Entitities;

namespace MySocailApp.Domain.QuestionDomain.ExamAggregate.Interfaces
{
    public interface IExamReadRepository
    {
        Task<Exam?> GetByIdAsync(int id, CancellationToken cancellationToken);
        Task<List<Exam>> GetAllAsync(CancellationToken cancellationToken);
    }
}

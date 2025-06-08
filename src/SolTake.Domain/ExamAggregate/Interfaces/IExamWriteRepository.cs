using SolTake.Domain.ExamAggregate.Entitities;

namespace SolTake.Domain.ExamAggregate.Interfaces
{
    public interface IExamWriteRepository
    {
        Task CreateAsync(Exam exam,CancellationToken cancellationToken);
    }
}

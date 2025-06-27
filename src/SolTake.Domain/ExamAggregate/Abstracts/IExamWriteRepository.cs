using SolTake.Domain.ExamAggregate.Entitities;

namespace SolTake.Domain.ExamAggregate.Abstracts
{
    public interface IExamWriteRepository
    {
        Task CreateAsync(Exam exam, CancellationToken cancellationToken);
    }
}

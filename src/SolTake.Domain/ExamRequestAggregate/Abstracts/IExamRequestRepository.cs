using SolTake.Domain.ExamRequestAggregate.Entities;

namespace SolTake.Domain.ExamRequestAggregate.Abstracts
{
    public interface IExamRequestRepository
    {
        Task CreateAsync(ExamRequest examRequest, CancellationToken cancellationToken);
        Task<ExamRequest?> GetByIdAsync(int id, CancellationToken cancellationToken);

        void Delete(ExamRequest examRequest);
    }
}

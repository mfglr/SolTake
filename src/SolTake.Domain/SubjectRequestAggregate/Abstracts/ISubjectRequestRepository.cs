using SolTake.Domain.SubjectRequestAggregate.Entities;

namespace SolTake.Domain.SubjectRequestAggregate.Abstracts
{
    public interface ISubjectRequestRepository
    {
        Task CreateAsync(SubjectRequest subjectRequest, CancellationToken cancellationToken);
        Task<SubjectRequest?> GetByIdAsync(int id, CancellationToken cancellationToken);
        void Delete(SubjectRequest subjectRequest);
    }
}

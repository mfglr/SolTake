namespace SolTake.ExamService.Domain
{
    public interface IExamRepository
    {
        Task<Exam?> GetByIdAsync(Guid id,CancellationToken cancellationToken);
        Task CreateAsync(Exam exam, CancellationToken cancellationToken);
        Task DeleteAsync(Guid id, CancellationToken cancellationToken);
        Task UpdateAsync(Exam exam, CancellationToken cancellationToken);
        Task<bool> ExistAsync(Guid id, CancellationToken cancellationToken);
        Task<bool> ExistAsync(ExamName name, CancellationToken cancellationToken);
    }
}

namespace SolTake.ExamService.Domain
{
    public interface IExamRepository
    {
        Task<Exam?> GetByIdAsync(ExamName name,CancellationToken cancellationToken);
        Task CreateAsync(Exam exam, CancellationToken cancellationToken);
        Task DeleteAsync(ExamName name, CancellationToken cancellationToken);
        Task UpdateAsync(Exam exam, CancellationToken cancellationToken);
        Task<bool> ExistAsync(ExamName name, CancellationToken cancellationToken);
    }
}

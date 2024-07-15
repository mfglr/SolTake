namespace MySocailApp.Domain.SubjectAggregate
{
    public interface ISubjectReadRepository
    {
        Task<List<Subject>> GetByExamIdAsync(int examId, CancellationToken cancellationToken);
    }
}

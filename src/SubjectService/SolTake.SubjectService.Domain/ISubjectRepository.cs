namespace SolTake.SubjectService.Domain
{
    public interface ISubjectRepository
    {
        Task CreateAsync(Subject subject, CancellationToken cancellationToken);
        Task<bool> ExistAsync(SubjectName name, CancellationToken cancellationToken);
    }
}

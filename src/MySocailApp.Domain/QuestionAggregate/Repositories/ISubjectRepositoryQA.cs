using MySocailApp.Domain.SubjectAggregate;

namespace MySocailApp.Domain.QuestionAggregate.Repositories
{
    public interface ISubjectRepositoryQA
    {
        Task<Subject?> GetByIdAsync(int id,CancellationToken cancellationToken);
    }
}

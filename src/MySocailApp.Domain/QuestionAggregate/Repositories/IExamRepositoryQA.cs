using MySocailApp.Domain.ExamAggregate;

namespace MySocailApp.Domain.QuestionAggregate.Repositories
{
    public interface IExamRepositoryQA
    {
        Task<Exam?> GetAsync(int id, CancellationToken cancellationToken);
    }
}

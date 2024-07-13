namespace MySocailApp.Domain.ExamAggregate
{
    public interface IExamReadRepository
    {
        Task<List<Exam>> GetAllAsync(CancellationToken cancellationToken);
    }
}

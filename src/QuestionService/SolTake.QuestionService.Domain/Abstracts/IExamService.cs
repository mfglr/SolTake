namespace SolTake.QuestionService.Domain.Abstracts
{
    public interface IExamService
    {
        Task<bool> ExistAsync(string name, CancellationToken cancellationToken);
    }
}

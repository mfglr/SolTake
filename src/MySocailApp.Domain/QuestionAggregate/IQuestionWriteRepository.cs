namespace MySocailApp.Domain.QuestionAggregate
{
    public interface IQuestionWriteRepository
    {
        Task CreateAsync(Question question, CancellationToken cancellationToken);
        Task<Question?> GetByIdAsync(int id);
    }
}

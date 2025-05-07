using MySocailApp.Domain.AIModelAggregate.Entities;

namespace MySocailApp.Domain.AIModelAggregate.Abstracts
{
    public interface IAIModelRepository
    {
        Task CreateAsync(AIModel aiModel, CancellationToken cancellationToken);
        List<AIModel> GetAll();
    }
}

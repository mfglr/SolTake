using SolTake.Domain.AIModelAggregate.Entities;

namespace SolTake.Domain.AIModelAggregate.Abstracts
{
    public interface IAIModelRepository
    {
        Task CreateAsync(AIModel aiModel, CancellationToken cancellationToken);
        void Delete(AIModel aiModel);
        Task<AIModel?> GetAsync(int id, CancellationToken cancellationToken);
        List<AIModel> GetAll();
    }
}

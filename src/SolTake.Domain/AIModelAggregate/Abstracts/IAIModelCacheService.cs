using SolTake.Domain.AIModelAggregate.Entities;

namespace SolTake.Domain.AIModelAggregate.Abstracts
{
    public interface IAIModelCacheService
    {
        IReadOnlyCollection<AIModel> Models { get; }
        void Add(AIModel model);
        void Remove(AIModel model);
        AIModel? Get(int id);
        AIModel? Get(string name);
    }
}

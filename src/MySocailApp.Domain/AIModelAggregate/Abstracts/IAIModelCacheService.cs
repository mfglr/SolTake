using MySocailApp.Domain.AIModelAggregate.Entities;

namespace MySocailApp.Domain.AIModelAggregate.Abstracts
{
    public interface IAIModelCacheService
    {
        IReadOnlyCollection<AIModel> Models { get; }
        void Add(AIModel model);
        void Remove(AIModel model);
    }
}

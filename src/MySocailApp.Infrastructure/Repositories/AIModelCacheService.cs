using MySocailApp.Domain.AIModelAggregate.Abstracts;
using MySocailApp.Domain.AIModelAggregate.Entities;

namespace MySocailApp.Infrastructure.Repositories
{
    public class AIModelCacheService(IEnumerable<AIModel> models) : IAIModelCacheService
    {
        private readonly List<AIModel> _models = models.ToList();
        public IReadOnlyCollection<AIModel> Models => _models;

        public void Add(AIModel model) => _models.Add(model);
        public AIModel? Get(int id) => _models.FirstOrDefault(x => x.Id ==id);
        public AIModel? Get(string name) => _models.FirstOrDefault(x => x.Name.Value == name);
        public void Remove(AIModel model) => _models.Remove(model);
    }
}

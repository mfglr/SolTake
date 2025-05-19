using MySocailApp.Application.Queries.AIModelAggregate;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Infrastructure.QueryRepositories.QueryableMappers;
using MySocailApp.Infrastructure.Repositories;
using SolTake.Domain.AIModelAggregate.Abstracts;

namespace MySocailApp.Infrastructure.QueryRepositories
{
    public class AIModelQueryRepository(IAIModelCacheService aiModelCachService) : IAIModelQueryRepository
    {
        public readonly IAIModelCacheService _aiModelCachService = aiModelCachService;

        public List<AIModelResponseDto> GetAllAIModels()
            => _aiModelCachService.Models.ToAIModelResponseDto().ToList();
    }
}

using SolTake.Application.Queries.AIModelAggregate;
using SolTake.Application.QueryRepositories;
using SolTake.Infrastructure.QueryRepositories.QueryableMappers;
using SolTake.Domain.AIModelAggregate.Abstracts;

namespace SolTake.Infrastructure.QueryRepositories
{
    public class AIModelQueryRepository(IAIModelCacheService aiModelCachService) : IAIModelQueryRepository
    {
        public readonly IAIModelCacheService _aiModelCachService = aiModelCachService;

        public List<AIModelResponseDto> GetAllAIModels()
            => _aiModelCachService.Models.ToAIModelResponseDto().ToList();
    }
}

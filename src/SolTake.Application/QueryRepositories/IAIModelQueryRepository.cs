using SolTake.Application.Queries.AIModelAggregate;

namespace SolTake.Application.QueryRepositories
{
    public interface IAIModelQueryRepository
    {
        public List<AIModelResponseDto> GetAllAIModels();
    }
}

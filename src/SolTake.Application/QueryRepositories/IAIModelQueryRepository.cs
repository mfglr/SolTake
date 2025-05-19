using MySocailApp.Application.Queries.AIModelAggregate;

namespace MySocailApp.Application.QueryRepositories
{
    public interface IAIModelQueryRepository
    {
        public List<AIModelResponseDto> GetAllAIModels();
    }
}

using MediatR;
using MySocailApp.Application.QueryRepositories;
using MySocailApp.Domain.AIModelAggregate.Abstracts;
namespace MySocailApp.Application.Queries.AIModelAggregate.GetAIModels
{
    public class GetAllAIModelsHandler(IAIModelQueryRepository aiModelQueryRepository) : IRequestHandler<GetAllAIModelsDto, List<AIModelResponseDto>>
    {
        private readonly IAIModelQueryRepository _aiModelQueryRepository = aiModelQueryRepository;

        public Task<List<AIModelResponseDto>> Handle(GetAllAIModelsDto request, CancellationToken cancellationToken)
            => Task.FromResult(_aiModelQueryRepository.GetAllAIModels());
    }
}

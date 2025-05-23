using MediatR;

namespace SolTake.Application.Queries.AIModelAggregate.GetAIModels
{
    public record GetAllAIModelsDto() : IRequest<List<AIModelResponseDto>>;
}

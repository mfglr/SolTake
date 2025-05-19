using MediatR;

namespace MySocailApp.Application.Queries.AIModelAggregate.GetAIModels
{
    public record GetAllAIModelsDto() : IRequest<List<AIModelResponseDto>>;
}

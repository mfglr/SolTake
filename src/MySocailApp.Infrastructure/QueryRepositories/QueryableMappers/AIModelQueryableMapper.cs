using MySocailApp.Application.Queries.AIModelAggregate;
using MySocailApp.Domain.AIModelAggregate.Entities;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class AIModelQueryableMapper
    {
        public static IEnumerable<AIModelResponseDto> ToAIModelResponseDto(this IEnumerable<AIModel> models)
            => models
                .Select(model => new AIModelResponseDto(
                    model.Id,
                    model.Name.Value,
                    model.SolPerInputToken.Amount,
                    model.SolPerOutputToken.Amount,
                    model.Image
                ));
    }
}

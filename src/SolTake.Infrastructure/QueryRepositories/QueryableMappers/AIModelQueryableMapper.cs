using SolTake.Application.Queries.AIModelAggregate;
using SolTake.Domain.AIModelAggregate.Entities;

namespace MySocailApp.Infrastructure.QueryRepositories.QueryableMappers
{
    public static class AIModelQueryableMapper
    {
        public static IEnumerable<AIModelResponseDto> ToAIModelResponseDto(this IEnumerable<AIModel> models)
            => models
                .Select(model => new AIModelResponseDto(
                    model.Id,
                    model.Name.Value,
                    model.SolPerInputTokenWithCommission.Amount,
                    model.SolPerOutputTokenWithCommission.Amount,
                    model.Image,
                    model.Commission
                ));
    }
}

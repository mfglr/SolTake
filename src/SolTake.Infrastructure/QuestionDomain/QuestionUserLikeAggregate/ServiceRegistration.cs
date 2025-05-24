using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.QuestionUserLikeAggregate.Abstracts;

namespace SolTake.Infrastructure.QuestionDomain.QuestionUserLikeAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionUserLikeAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IQuestionUserLikeReadRepository, QuestionUserLikeReadRepository>()
                .AddScoped<IQuestionUserLikeWriteRepository, QuestionUserLikeWriteRepository>();

    }
}

using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.QuestionAggregate.Abstracts;

namespace SolTake.Infrastructure.QuestionDomain.QuestionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IQuestionReadRepository, QuestionReadRepository>()
                .AddScoped<IQuestionWriteRepository, QuestionWriteRepository>();

    }
}

using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;

namespace MySocailApp.Infrastructure.QuestionDomain.QuestionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IQuestionReadRepository, QuestionReadRepository>()
                .AddScoped<IQuestionWriteRepository, QuestionWriteRepository>();

    }
}

using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.TopicAggregate.Abstracts;

namespace SolTake.Infrastructure.TopicAggregate
{
    internal static class ServiceRegistration
    {
        public static IServiceCollection AddTopicInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<ITopicWriteRepository, TopicWriteRepository>()
                .AddScoped<ITopicReadRepository, TopicReadRepository>();
    }
}

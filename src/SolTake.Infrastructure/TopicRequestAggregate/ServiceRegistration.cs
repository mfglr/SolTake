using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.TopicRequestAggregate.Abstracts;

namespace SolTake.Infrastructure.TopicRequestAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddTopicRequestInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<ITopicRequestRepository, TopicRequestRepository>();
    }
}

using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Infrastructure.StoryDomain.StoryAggregate;

namespace MySocailApp.Infrastructure.StoryDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddStoryDomainInfrastructureServices(this IServiceCollection services)
            => services
                .AddStoryAggregateInfrastructureServices();
    }
}

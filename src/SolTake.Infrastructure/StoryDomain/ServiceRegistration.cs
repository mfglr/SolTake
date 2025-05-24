using Microsoft.Extensions.DependencyInjection;
using SolTake.Infrastructure.StoryDomain.StoryAggregate;
using SolTake.Infrastructure.StoryDomain.StoryUserViewAggregate;

namespace SolTake.Infrastructure.StoryDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddStoryDomainInfrastructureServices(this IServiceCollection services)
            => services
                .AddStoryAggregateInfrastructureServices()
                .AddStoryUserViewAggregateInfrastructureServices();
    }
}

using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.StoryAggregate.Abstracts;

namespace SolTake.Infrastructure.StoryDomain.StoryAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddStoryAggregateInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IStoryRepository,StoryRepository>();
    }
}

using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.StoryUserViewAggregate.Absracts;

namespace MySocailApp.Infrastructure.StoryDomain.StoryUserViewAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddStoryUserViewAggregateInfrastructureServices(this IServiceCollection services)
            => services.AddScoped<IStoryUserViewRepository,StoryUserViewRepository>();
    }
}

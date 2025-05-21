using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.StoryUserViewAggregate.DomainServices;

namespace SolTake.Domain.StoryUserViewAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddStoryUserViewDomainServices(this IServiceCollection services)
            => services
                .AddScoped<StoryUserViewCreatorDomainService>();
    }
}

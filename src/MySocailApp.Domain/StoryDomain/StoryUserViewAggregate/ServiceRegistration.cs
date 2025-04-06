using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.StoryDomain.StoryUserViewAggregate.DomainServices;

namespace MySocailApp.Domain.StoryDomain.StoryUserViewAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddStoryUserViewDomainServices(this IServiceCollection services)
            => services
                .AddScoped<StoryUserViewCreatorDomainService>();
    }
}

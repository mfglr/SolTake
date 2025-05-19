using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.StoryUserViewAggregate.DomainServices;

namespace MySocailApp.Domain.StoryUserViewAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddStoryUserViewDomainServices(this IServiceCollection services)
            => services
                .AddScoped<StoryUserViewCreatorDomainService>();
    }
}

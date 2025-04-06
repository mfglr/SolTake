using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.StoryDomain.StoryUserViewAggregate;

namespace MySocailApp.Domain.StoryDomain
{
    public static class ServiceRegistraiton
    {
        public static IServiceCollection AddStoryDomainServices(this IServiceCollection services)
            => services.AddStoryUserViewDomainServices();
    }
}

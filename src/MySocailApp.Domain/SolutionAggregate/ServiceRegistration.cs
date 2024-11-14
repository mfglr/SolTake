using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.SolutionAggregate.DomainServices;

namespace MySocailApp.Domain.SolutionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionDomainServices(this IServiceCollection services)
            => services
                .AddScoped<SolutionCreatorDomainService>()
                .AddScoped<SolutionStateMarkerDomainService>();
    }
}

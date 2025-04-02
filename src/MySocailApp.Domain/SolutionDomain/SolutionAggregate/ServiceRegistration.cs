using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.DomainServices;

namespace MySocailApp.Domain.SolutionDomain.SolutionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionDomainServices(this IServiceCollection services)
            => services
                .AddScoped<SolutionStateMarkerDomainService>();
    }
}

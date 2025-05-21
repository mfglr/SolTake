using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.SolutionAggregate.DomainServices;

namespace SolTake.Domain.SolutionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionDomainServices(this IServiceCollection services)
            => services
                .AddScoped<SolutionStateMarkerDomainService>();
    }
}

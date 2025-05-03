using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionUserVoteAggregate.DomainServices;

namespace MySocailApp.Domain.SolutionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionDomainServices(this IServiceCollection services)
            => services
                .AddScoped<SolutionStateMarkerDomainService>();
    }
}

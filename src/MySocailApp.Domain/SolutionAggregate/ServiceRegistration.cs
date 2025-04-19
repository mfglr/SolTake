using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.SolutionAggregate.DomainServices;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.DomainServices;

namespace MySocailApp.Domain.SolutionAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionDomainServices(this IServiceCollection services)
            => services
                .AddScoped<SolutionCreatorDomainService>()
                .AddScoped<SolutionStateMarkerDomainService>()
                .AddScoped<SolutionVoterDomainService>();
    }
}

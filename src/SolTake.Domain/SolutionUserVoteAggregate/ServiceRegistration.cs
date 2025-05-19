using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.SolutionUserVoteAggregate.DomainServices;

namespace MySocailApp.Domain.SolutionUserVoteAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionUserVoteDomainServices(this IServiceCollection services)
            => services
                .AddScoped<SolutionVoterDomainService>();
    }
}

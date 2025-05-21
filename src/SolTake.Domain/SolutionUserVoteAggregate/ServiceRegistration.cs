using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.SolutionUserVoteAggregate.DomainServices;

namespace SolTake.Domain.SolutionUserVoteAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionUserVoteDomainServices(this IServiceCollection services)
            => services
                .AddScoped<SolutionVoterDomainService>();
    }
}

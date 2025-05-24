using Microsoft.Extensions.DependencyInjection;
using SolTake.Infrastructure.SolutionDomain.SolutionAggregate;
using SolTake.Infrastructure.SolutionDomain.SolutionUserSaveAggregate;
using SolTake.Infrastructure.SolutionDomain.SolutionUserVoteAggregate;

namespace SolTake.Infrastructure.SolutionDomain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionDomainInfrastructureServices(this IServiceCollection services)
            => services
                .AddSolutionAggregate()
                .AddSolutionUserSaveAggregate()
                .AddSolutionUserVoteAggregate();
    }
}

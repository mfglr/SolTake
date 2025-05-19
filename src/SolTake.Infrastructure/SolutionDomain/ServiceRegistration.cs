using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Infrastructure.SolutionDomain.SolutionAggregate;
using MySocailApp.Infrastructure.SolutionDomain.SolutionUserSaveAggregate;
using MySocailApp.Infrastructure.SolutionDomain.SolutionUserVoteAggregate;

namespace MySocailApp.Infrastructure.SolutionDomain
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

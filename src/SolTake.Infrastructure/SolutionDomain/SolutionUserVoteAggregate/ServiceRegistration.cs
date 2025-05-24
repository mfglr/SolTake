using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.SolutionUserVoteAggregate.Abstracts;

namespace SolTake.Infrastructure.SolutionDomain.SolutionUserVoteAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionUserVoteAggregate(this IServiceCollection services)
            => services
                .AddScoped<ISolutionUserVoteWriteRepository, SolutionUserVoteWriteRepository>()
                .AddScoped<ISolutionUserVoteReadRepository, SolutionUserVoteReadRepository>();
    }
}

using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.SolutionUserVoteAggregate.Abstracts;

namespace MySocailApp.Infrastructure.SolutionDomain.SolutionUserVoteAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionUserVoteAggregate(this IServiceCollection services)
            => services
                .AddScoped<ISolutionUserVoteWriteRepository, SolutionUserVoteWriteRepository>()
                .AddScoped<ISolutionUserVoteReadRepository, SolutionUserVoteReadRepository>();
    }
}

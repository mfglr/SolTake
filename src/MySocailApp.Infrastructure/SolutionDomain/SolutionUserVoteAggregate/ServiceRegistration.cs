using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.SolutionDomain.SolutionUserVoteAggregate.Abstracts;

namespace MySocailApp.Infrastructure.SolutionDomain.SolutionUserVoteAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSolutionUserVoteAggregate(this IServiceCollection services)
            => services
                .AddScoped<ISolutionUserVoteWriteRepository,SolutionUserVoteWriteRepository>();
    }
}
